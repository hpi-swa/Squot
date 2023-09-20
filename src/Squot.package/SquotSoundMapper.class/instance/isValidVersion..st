ui
isValidVersion: anObject
	^ anObject isNil or: [anObject isKindOf: AbstractSound]