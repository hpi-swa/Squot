private
preparePackFileToPushRefs: updateAssociations of: aRepository 
	| creator packFile historyWalker remoteRefs mergeBases commits |
	packFile := GitPackFile new repository: aRepository; yourself.
	creator := GitPackFileCreator on: packFile.
	remoteRefs := refs copy. remoteRefs removeKey: #capabilities. self flag: #hack.
	mergeBases := (updateAssociations
		collect: [:each | each value mergeBaseWithAnyOf: remoteRefs values]
		thenSelect: [:each | each notNil]).
	'Packing Git objects' displaySequentialProgress:
		[commits := (historyWalker := GitHistoryWalker new)
				excludeAncestorsOfAll: mergeBases;
				startingFromAll: (updateAssociations collect: [:each | each value]).
		commits
			do: [:each | self addNewObjectsIn: each to: creator basedOn: remoteRefs values]
			displayingProgress: 'Collecting objects from commits'.
		creator writePackFile].
	^ packFile
	