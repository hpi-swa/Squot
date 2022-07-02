caching
continueBuildingCommitList: anOrderedCollection asyncWith: aHistoryWalker
	commitListBuildProcess := 
	[self withUnitOfWork:
		[aHistoryWalker do: [:each | anOrderedCollection add: each].
		cachedCommitList := self sortVersionsTopologically: anOrderedCollection.
		Project current addDeferredUIMessage: [self withUnitOfWork: [self changed: #commitList]]]]
			forkAt: Processor userBackgroundPriority
			named: self class name, ' commit list loader'.