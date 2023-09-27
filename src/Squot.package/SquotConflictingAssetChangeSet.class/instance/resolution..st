accessing
resolution: anObject
	resolution := anObject.
	self markAsEdited.
	self changed: #resolution.