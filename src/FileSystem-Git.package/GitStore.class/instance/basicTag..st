internal
basicTag: tagName
	repository 
		updateRef: repository tagsDir / tagName 
		to: revision hexHash.
	self basicReset.