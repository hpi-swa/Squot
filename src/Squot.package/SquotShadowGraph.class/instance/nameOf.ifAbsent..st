accessing
nameOf: anObject ifAbsent: absentBlock
	^ objectNames at: anObject ifAbsent:
		[delegateRegistry
			ifNotNil: [delegateRegistry nameOf: anObject ifAbsent: absentBlock]
			ifNil: [absentBlock value]]