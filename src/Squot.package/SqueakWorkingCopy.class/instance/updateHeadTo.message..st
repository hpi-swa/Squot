git-operations
updateHeadTo: aCommit message: aString
	self unitOfWork
		updateRef: self headRefName
		to: aCommit hexHash
		message: aString.