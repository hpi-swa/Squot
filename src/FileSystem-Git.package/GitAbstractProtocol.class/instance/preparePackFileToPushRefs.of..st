private
preparePackFileToPushRefs: updateAssociations of: aRepository 
	| creator packFile historyWalker remoteRefs mergeBases commits |
	'Packing Git objects' displaySequentialProgress:
		[packFile := GitPackFile new repository: aRepository; yourself.
		creator := GitPackFileCreator on: packFile.
		remoteRefs := refs copy. remoteRefs removeKey: #capabilities. self flag: #hack.
		mergeBases := ((updateAssociations
			gather: [:each | each value allMergeBasesWithAnyOf: remoteRefs values])
			asSet asArray
			select: [:each | each notNil]).
		commits := (historyWalker := GitHistoryWalker new)
				excludeAncestorsOfAll: mergeBases;
				startingFromAll: (updateAssociations collect: [:each | each value]).
		commits
			do: [:each | self addNewObjectsIn: each to: creator basedOn: remoteRefs values]
			displayingProgress: 'Collecting objects from commits'.
		creator writePackFile].
	^ packFile
	