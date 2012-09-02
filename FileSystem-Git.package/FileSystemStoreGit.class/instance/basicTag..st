internal
basicTag: tagName
	repository updateRef: repository tagsDir / tagName to: revision signature.
	self basicReset.