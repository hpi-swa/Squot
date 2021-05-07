delegating
doesNotUnderstand: aMessage
	"Forward other messages to the artifact."
	| answer |
	^ (thisContext
		object: (answer := aMessage sendTo: artifact)
		eqeq: artifact)
		
		ifTrue: [self]
		ifFalse: [answer]