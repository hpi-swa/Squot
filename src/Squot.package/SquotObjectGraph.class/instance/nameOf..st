accessing
nameOf: anObject
	^ super nameOf: anObject ifAbsent: [delegateRegistry nameOf: anObject]