as yet unclassified
nameOf: anObject ifAbsent: absentBlock
	^ self value
		ifNil: [absentBlock value]
		ifNotNil: [:registry | registry nameOf: anObject ifAbsent: absentBlock]