accessing
commitSelection: anObject
	commitSelection := anObject.
	self changed: #contents.
	self changed: #objectList.