internal
basicTag: tagName
	self unitOfWork 
		updateRef: 'refs/tags/', tagName
		to: revision hexHash.
	self basicReset.