accessing
target
	^ self isSymbolic
		ifTrue: [self targetRef]
		ifFalse: [self signature]