private
preparePackFileToPushRefs: updateAssociations of: aRepository 
	| creator packFile historyWalker remoteRefs mergeBases |
	packFile := GitPackFile new repository: aRepository; yourself.
	creator := GitPackFileCreator on: packFile.
	remoteRefs := refs copy. remoteRefs removeKey: #capabilities. self flag: #hack.
	mergeBases := (updateAssociations
		collect: [:each | each value nearestMergeBaseWithAnyOf: remoteRefs values]).
	(historyWalker := GitHistoryWalker new)
		excludeAncestorsOfAll: mergeBases;
		startingFromAll: (updateAssociations collect: [:each | each value])
		do: [:each | self addNewObjectsIn: each to: creator basedOn: remoteRefs values].
	creator writePackFile.
	^ packFile
	