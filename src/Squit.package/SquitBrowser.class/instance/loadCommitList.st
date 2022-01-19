ui
loadCommitList
	selectedHistorian ifNil:
		[cachedCommitList := #().
		commitListBuildProcess ifNotNil: [commitListBuildProcess terminate].
		^ self changed: #commitList].
	self withUnitOfWork:
		[selectedHistorian version ~= (cachedCommitList at: 1 ifAbsent: [])
			ifTrue: [self rebuildCommitList]].