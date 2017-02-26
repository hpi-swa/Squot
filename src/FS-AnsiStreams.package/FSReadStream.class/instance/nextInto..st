squeak
nextInto: aCollection
	| positionInCollection maxElements |
	isBinary ifTrue: [^ self basicNextInto: aCollection].
	positionInCollection := 1.
	maxElements := aCollection size.
	[positionInCollection <= maxElements and: [self atEnd not]]
		whileTrue: [aCollection at: positionInCollection put: (self converter nextFromStream: self).
			positionInCollection := positionInCollection + 1].
	^ positionInCollection - 1 = aCollection size
		ifTrue: [aCollection]
		ifFalse: [aCollection copyFrom: 1 to: positionInCollection - 1]