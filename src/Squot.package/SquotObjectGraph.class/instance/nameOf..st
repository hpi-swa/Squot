accessing
nameOf: anObject
	^ super nameOf: anObject
		ifAbsent: [shadows keyAtValue: anObject
				ifAbsent: [delegateRegistry nameOf: anObject]]