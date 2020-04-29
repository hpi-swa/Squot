accessing
targetOf: aString
	"Answer the value of the reference, unresolved. Answer nil if the reference does not exist."
	self deprecated: 'Use ref: instead'.
	^ self subclassResponsibility