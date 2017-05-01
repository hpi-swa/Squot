caching
continueBuildingCommitList: anOrderedCollection asyncWith: aHistoryWalker
	commitListBuildProcess ifNotNil: [commitListBuildProcess terminate].
	commitListBuildProcess := 
	[aHistoryWalker continueDo: [:each | anOrderedCollection add: each].
	cachedCommitList := anOrderedCollection.
	self changed: #commitList]
		forkAt: Processor userBackgroundPriority
		named: self class name, ' commit list builder'.