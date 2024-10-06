initialization
setItem: aRebaseOperationOrNil
	super setItem: aRebaseOperationOrNil.
	self string: (aRebaseOperationOrNil columns joinSeparatedBy: Character tab).