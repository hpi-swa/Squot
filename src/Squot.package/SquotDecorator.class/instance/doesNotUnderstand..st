delegating
doesNotUnderstand: aMessage
	| answer |
	^ (answer := aMessage sendTo: decoratedObject) == decoratedObject
		ifTrue: [self]
		ifFalse: [answer]