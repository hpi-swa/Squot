squeak
nextInto: aCollection
	isBinary ifTrue: [^ self basicNextInto: aCollection].
	position := 1.
	aCollection size timesRepeat: [aCollection at: position put: (self converter nextFromStream: self).
		position := position + 1].