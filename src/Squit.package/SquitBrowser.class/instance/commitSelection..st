accessing
commitSelection: anObject
	commitSelection := anObject.
	self commitSelectionChanged.
	commitToDiffAgainst ifNotNil:
		[ | otherCommit |
		otherCommit := commitToDiffAgainst.
		commitToDiffAgainst := nil.
		self compareVersions: commitSelection with: otherCommit]