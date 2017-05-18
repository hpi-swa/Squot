testing
isHead
	^ self expandedName = (gitRepository expandRef: gitRepository headRef)