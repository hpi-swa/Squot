private
preparePackFileToPushRefs: updateAssociations of: aRepository 
	| creator packFile historyWalker remoteRefs mergeBases excluder commits |
	'Packing Git objects' displaySequentialProgress:
		[packFile := GitPackFile new repository: aRepository; yourself.
		creator := GitPackFileCreator on: packFile.
		remoteRefs := refs copy. remoteRefs removeKey: #capabilities. self flag: #hack.
		mergeBases := ((updateAssociations
			gather: [:each | each value allMergeBasesWithAnyOf: remoteRefs values])
			asSet asArray
			select: [:each | each notNil]).
		excluder := GitPackFileExcluder new
			packFileCreator: creator;
			yourself.
		mergeBases
			do: [:each | excluder visitTree: each tree; visitRest]
			displayingProgress: 'Excluding objects that the remote already has'.
		commits := (historyWalker := GitHistoryWalker new)
				excludeAncestorsOfAll: mergeBases;
				startingFromAll: (updateAssociations collect: [:each | each value]).
		commits
			do:
				[:each | creator
					addObject: each "not the parents, that's why not visitCommit:";
					visitTree: each tree]
			displayingProgress: 'Collecting objects from commits'.
		creator writePackFile].
	^ packFile
	