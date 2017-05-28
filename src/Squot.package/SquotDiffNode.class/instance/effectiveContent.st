accessing
effectiveContent
	^ self isActive ifTrue: [content] ifFalse: [nil]