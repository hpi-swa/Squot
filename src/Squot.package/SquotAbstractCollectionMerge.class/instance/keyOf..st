accessing
keyOf: anObject
	^ self keyOf: anObject ifAbsent: [NotFound signalFor: anObject]