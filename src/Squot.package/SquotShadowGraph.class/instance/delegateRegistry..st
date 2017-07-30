accessing
delegateRegistry: anObject
	anObject ifNil: [^ self].
	delegateRegistry := anObject