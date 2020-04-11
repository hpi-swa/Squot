delegating
doesNotUnderstand: aMessage
	| answer |
	^ (thisContext
		object: (answer := aMessage sendTo: decoratedObject)
		eqeq: decoratedObject)
		
		ifTrue: [self]
		ifFalse: [answer]