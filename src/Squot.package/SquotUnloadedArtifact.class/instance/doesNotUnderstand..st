delegating
doesNotUnderstand: aMessage
	| answer |
	^ (thisContext
		object: (answer := aMessage sendTo: artifact)
		eqeq: artifact)
		
		ifTrue: [self]
		ifFalse: [answer]