adding
add: aString
	(aString includes: $/)
		ifTrue: [self addInTree: aString]
		ifFalse: [self addRef: aString].