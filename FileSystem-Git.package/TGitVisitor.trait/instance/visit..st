visiting
visit: anObject
	"avoid extending Collection"
	anObject isCollection ifTrue: [ ^ self visitCollection: anObject ].
	
	anObject accept: self