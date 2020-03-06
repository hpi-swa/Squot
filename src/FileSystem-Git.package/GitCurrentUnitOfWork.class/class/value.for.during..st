accessing
value: aGitUnitOfWork for: anObject during: aBlock
	"Sets the current value for the variable and register it for the given object (usually a repository) during aBlock."
	^ self
		value:
			(self value copy
				at: anObject put: aGitUnitOfWork;
				yourself)
		during: aBlock