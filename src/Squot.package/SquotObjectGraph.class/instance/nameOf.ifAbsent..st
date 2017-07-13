accessing
nameOf: anObject ifAbsent: absentBlock
	^ super nameOf: anObject
		ifAbsent: [delegateRegistry nameOf: anObject ifAbsent: absentBlock]