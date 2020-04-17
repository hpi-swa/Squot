public-testing
hasWorkingCopy
	| isBare |
	self privateDeprecatedUseUnitOfWork.
	isBare := (self configAt: 'core.bare' ifAbsent: ['false']) gitConfigBoolean.
	^ isBare not