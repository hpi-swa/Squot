accessing
objectNamed: aName ifAbsent: absentBlock
	^ objects
		at: aName
		ifAbsent: [delegateRegistry ifNotNil:
					[delegateRegistry objectNamed: aName ifAbsent: absentBlock]]