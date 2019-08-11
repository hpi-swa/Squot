accessing
keyOf: anObject
	^ self keyOf: anObject ifAbsent: [NotFound signal: anObject]