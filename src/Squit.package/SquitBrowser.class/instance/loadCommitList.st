ui
loadCommitList
	self withUnitOfWork:
		[selectedHistorian ifNil:
			[cachedCommitList := #().
			commitListBuildProcess ifNotNil: [commitListBuildProcess terminate].
			^ self changed: #commitList].
		selectedHistorian version = (cachedCommitList at: 1 ifAbsent: [])
			ifTrue: [^ self].
		self rebuildCommitList.
		self changed: #commitList].