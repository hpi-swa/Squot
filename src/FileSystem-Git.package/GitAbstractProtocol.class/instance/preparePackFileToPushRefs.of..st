private
preparePackFileToPushRefs: updateAssociations of: aRepository 
	| creator packFile historyWalker remoteRefs |
	packFile := GitPackFile new repository: aRepository; yourself.
	creator := GitPackFileCreator on: packFile.
	historyWalker := GitHistoryWalker new.
	remoteRefs := refs copy. remoteRefs removeKey: #capabilities. self flag: #hack.
	historyWalker sinkCommits: (remoteRefs values collect: [:each | aRepository objectNamed: each ifAbsent: []]).
	historyWalker
		startingFromAll: (updateAssociations collect: [:each | each value])
		do: [:each | self addNewObjectsIn: each to: creator basedOn: remoteRefs values].
	creator writePackFile.
	^ packFile
	