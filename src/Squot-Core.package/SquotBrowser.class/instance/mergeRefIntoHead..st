merging
mergeRefIntoHead: aString
	self
		mergeCommitIntoHead: (self unitOfWork objectReferenced: aString)
		displayName: (GitReference shortName: aString).