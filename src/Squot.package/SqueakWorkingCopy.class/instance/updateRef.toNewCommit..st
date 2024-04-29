git-operations
updateRef: aString toNewCommit: aCommit
	self unitOfWork
		updateRef: aString
		to: aCommit hexHash
		message: 'commit: ', aCommit message.