as yet unclassified
nameOf: anObject
	^ self value
		ifNil: [NotFound signal: anObject]
		ifNotNil: [:registry | registry nameOf: anObject]