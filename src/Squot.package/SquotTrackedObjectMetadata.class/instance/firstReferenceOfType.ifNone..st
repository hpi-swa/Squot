accessing
firstReferenceOfType: aString ifNone: aBlock
	^ (self at: #references) detect: [:each | (each value at: #type) = aString] ifNone: aBlock