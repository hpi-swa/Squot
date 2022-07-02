caching
rebuildCommitList
	| list count walker |
	commitListBuildProcess ifNotNil: [commitListBuildProcess terminate].
	(self hasBranchSelection and: [selectedHistorian version notNil]) ifFalse:
		[cachedCommitList := #().
		^ self changed: #commitList].
	list := OrderedCollection new.
	count := 0.
	(walker := selectedHistorian repository historyWalkClass new)
		nextPut: selectedHistorian version.
	[walker atEnd or: [count > 30]]
		whileFalse:
			[list add: walker next.
			count := count + 1].
	cachedCommitList := self sortVersionsTopologically: list.
	walker atEnd ifFalse:
		[self continueAsyncBuildingCommitList: list historyWalk: walker].