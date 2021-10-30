accessing
keyOf: anObject
	^ self keyOf: anObject ifAbsent: [(NotFound object: anObject) signal]