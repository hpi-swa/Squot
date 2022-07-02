ui
loadCommitList
	selectedHistorian ifNil:
		[cachedCommitList := #().
		commitListBuildProcess ifNotNil: [commitListBuildProcess terminate].
		^ self changed: #commitList].
	self withUnitOfWork:
		[self updateHistorianDecorationsMap.
		selectedHistorian version ~= (cachedCommitList at: 1 ifAbsent: [])
			ifTrue: [self rebuildCommitList].
		self changed: #commitList "At least the decorations could have changed."].