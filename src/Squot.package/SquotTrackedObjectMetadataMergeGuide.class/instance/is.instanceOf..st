callbacks
is: anObject instanceOf: anotherObject
	self flag: #todo. "Should sender ask mirror instead?"
	^ anObject = anotherObject