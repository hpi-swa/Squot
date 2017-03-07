accessing
back
	"Go back one element and return it."
	self atStart ifTrue: [self errorCantGoBack].
	self skip: -1.
	^ self peek