accessing
nameOf: anObject
	^ objectNames at: anObject ifAbsent:
		[delegateRegistry
			ifNotNil: [delegateRegistry nameOf: anObject]
			ifNil: [self errorNotFound: anObject]]