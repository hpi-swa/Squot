comparing
is: anObject comparableTo: anotherObject
	self assert: anObject class isBits.
	^ anObject isMemberOf: anotherObject class