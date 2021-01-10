initialize-release
left: leftAddedObject right: rightAddedObject
	self deprecated: 'Use setWorking:incoming: instead'.
	working := leftAddedObject.
	incoming := rightAddedObject.
	base := nil.
	self resetChoice.