testing
hasWorkingCopy
	| isBare |
	isBare := (self configAt: 'core.bare' ifAbsent: ['false']) gitConfigBoolean.
	^ isBare not