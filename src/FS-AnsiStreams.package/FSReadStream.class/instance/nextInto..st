squeak
nextInto: aCollection
	| positionInCollection |
	isBinary ifTrue: [^ self basicNextInto: aCollection].
	positionInCollection := 1.
	(aCollection size min: handle size - position + 1) timesRepeat: [aCollection at: positionInCollection put: (self converter nextFromStream: self).
		positionInCollection := positionInCollection + 1].
	^ positionInCollection - 1 = aCollection size
		ifTrue: [aCollection]
		ifFalse: [aCollection copyFrom: 1 to: positionInCollection - 1]