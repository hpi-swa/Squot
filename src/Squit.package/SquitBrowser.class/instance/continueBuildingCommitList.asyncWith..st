caching
continueBuildingCommitList: anOrderedCollection asyncWith: aHistoryWalker
	commitListBuildProcess := 
	[aHistoryWalker do: [:each | anOrderedCollection add: each].
	cachedCommitList := self sortVersionsTopologically: anOrderedCollection.
	Project current addDeferredUIMessage: [self changed: #commitList]]
		forkAt: Processor userBackgroundPriority
		named: self class name, ' commit list loader'.