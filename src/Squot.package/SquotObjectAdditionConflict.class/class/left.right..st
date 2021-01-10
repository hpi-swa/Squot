instance creation
left: leftAddedObject right: rightAddedObject
	self deprecated: 'Use working:incoming: instead'.
	^ self new
		left: leftAddedObject right: rightAddedObject;
		yourself