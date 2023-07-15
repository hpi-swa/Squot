accessing
firstReferenceOfType: aString
	^ self firstReferenceOfType: aString ifNone: [self error: 'Aritifact is not a ', aString]