as yet unclassified
setItem: aRebaseOperation
	super setItem: aRebaseOperation.
	self string: ({
		aRebaseOperation textIcon.
		aRebaseOperation operationName.
		aRebaseOperation label.
	} joinSeparatedBy: Character tab).