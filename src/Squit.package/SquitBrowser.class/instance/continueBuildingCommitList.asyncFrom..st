caching
continueBuildingCommitList: anOrderedCollection asyncFrom: aVersion
	commitListBuildProcess ifNotNil: [commitListBuildProcess terminate].
	commitListBuildProcess := 
	[SquotHistoryWalker new
		startingFrom: aVersion
		do: [:each | anOrderedCollection add: each].
	cachedCommitList := anOrderedCollection.
	self changed: #commitList]
		forkAt: Processor userBackgroundPriority
		named: self class name, ' commit list builder'.