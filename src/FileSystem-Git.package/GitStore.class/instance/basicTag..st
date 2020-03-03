internal
basicTag: tagName
	repository 
		updateRef: 'refs/tags/', tagName
		to: revision hexHash.
	self basicReset.