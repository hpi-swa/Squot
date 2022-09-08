ui
loadCommitList
	selectedHistorian ifNil:
		[cachedCommitList := #().
		commitListBuildProcess ifNotNil: [commitListBuildProcess terminate].
		^ self changed: #commitList].
	self withUnitOfWork:
		[| oldHistoriansVersions rebuild |
		rebuild := false.
		oldHistoriansVersions := historiansForDecoration.
		self updateHistorianDecorationsMap.
		selectedHistorian version ~= (cachedCommitList at: 1 ifAbsent: [])
			ifTrue:
				[self rebuildCommitList.
				rebuild := true].
		"Must send `changed: #commitList` if the list has actually changed, but when sending it, the view will scroll back to the selected commit. If users are scrolling through the list, this will upset them. So avoid sending it unless it is really warranted."
		(rebuild or: [oldHistoriansVersions ~= historiansForDecoration])
			ifTrue: [self changed: #commitList]].