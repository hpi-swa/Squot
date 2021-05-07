error handling
doesNotUnderstand: aMessage
	| answer |
	answer := aMessage sendTo: version.
	^ (thisContext object: answer eqeq: version)
		ifTrue: [self]
		ifFalse: [answer]