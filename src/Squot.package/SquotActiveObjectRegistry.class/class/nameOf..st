as yet unclassified
nameOf: anObject
	^ self value
		ifNil: [NotFound signalFor: anObject]
		ifNotNil: [:registry | registry nameOf: anObject]