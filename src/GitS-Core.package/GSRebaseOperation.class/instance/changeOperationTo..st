operation-changing
changeOperationTo: aRebaseOperationClass
	self assert: (self class canChangeTo: aRebaseOperationClass).
	^ aRebaseOperationClass new
		copyFrom: self;
		requestMissingInstVars;
		yourself