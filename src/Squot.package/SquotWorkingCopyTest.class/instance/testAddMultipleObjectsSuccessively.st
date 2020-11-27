tests
testAddMultipleObjectsSuccessively
	"Some repositories impose constraints on the load order. Check that it does not introduce unnecessary differences."
	| o1 o2 |
	o1 := ValueHolder new contents: 'Text 1'.
	o2 := ValueHolder new contents: 'Text 2'.
	repository withUnitOfWork:
		[workingCopy add: o1 at: 'object 1'.
		workingCopy saveVersionWithMessage: 'Add object'.
		self denyChangesInWorkingCopy.
		workingCopy add: o2 at: 'object 2'.
		workingCopy saveVersionWithMessage: 'Add another object'.
		self denyChangesInWorkingCopy].