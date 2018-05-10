as yet unclassified
shadowOf: anObject ifAbsent: absentBlock
	^ patchedObjectGraph
		shadowNamed:
			(patchedObjectGraph
				nameOf: anObject undecorated
				ifAbsent: [^ absentBlock value])
		ifAbsent: [^ absentBlock value]