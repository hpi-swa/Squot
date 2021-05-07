actions on versions
actionBranchResetToCommit
	| index |
	self hasBranchSelection ifFalse: [^ self].
	self withUnitOfWork:
	[selectedHistorian version: self commitSelection.
	(index := cachedCommitList indexOf: self commitSelection) ~~ 0
		ifTrue: [cachedCommitList := cachedCommitList
				copyFrom: index to: cachedCommitList size]
		ifFalse: [self loadCommitList].
	self changed: #commitList].