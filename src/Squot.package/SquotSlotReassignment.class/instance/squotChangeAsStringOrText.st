*Squot-Tools-Diffs
squotChangeAsStringOrText
	self key isString
		ifTrue: [^ self key, ' := ', self replacementShadow printString]
		ifFalse: [^ 'at: ', self key printString, ' put: ', self replacementShadow printString]