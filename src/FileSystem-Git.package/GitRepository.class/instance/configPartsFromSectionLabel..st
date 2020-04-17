private configuration
configPartsFromSectionLabel: aString
	self privateDeprecatedUseUnitOfWork.
	^ (aString includesSubstring: ' "')
		ifTrue: [{aString copyUpTo: Character space},
			((aString copyFrom: (aString indexOf: $") + 1 to: aString size - 1)
				splitBy: '.')]
		ifFalse: [{aString}]