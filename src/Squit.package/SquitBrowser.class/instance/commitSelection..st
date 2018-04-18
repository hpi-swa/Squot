accessing
commitSelection: anObject
	commitSelection := anObject.
	self commitSelectionChanged.
	commitToDiffAgainst ifNotNil:
		[self compareVersions: commitSelection with: commitToDiffAgainst.
		commitToDiffAgainst := nil]