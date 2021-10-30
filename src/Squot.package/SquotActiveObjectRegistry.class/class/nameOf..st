as yet unclassified
nameOf: anObject
	^ self value
		ifNil: [(NotFound object: anObject) signal]
		ifNotNil: [:registry | registry nameOf: anObject]