git-operations
fastForwardTo: aCommit displayName: aString
	self unitOfWork
		updateRef: self headRefName
		to: aCommit asHexHash
		message: ('merge {1}: Fast-forward' format: {aString}).