accessing
currentBranchIfNilInformAnd: aBlock
	| branch headRef |
	headRef := self activeWorkingCopy headRef.
	(headRef isSymbolic and: [
		branch := headRef targetRef.
		self activeWorkingCopy isSqueakBranchRef: branch])
			ifFalse: [self inform: 'Please switch to a branch first.'. ^ aBlock value].
	^ branch