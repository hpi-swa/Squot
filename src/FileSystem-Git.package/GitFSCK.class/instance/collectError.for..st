validating
collectError: error for: anObject
	| errorObject |
	errorObject :=	(error respondsTo: #copyUpTo:)
		ifTrue: [ error copyUpTo: referenceContext ]	
		ifFalse: [ error ].
	self addError: errorObject for: anObject