instance creation
tryNamed: aString from: aWorkingCopyClass
	^ self forWorkingCopy: (aWorkingCopyClass named: aString ifAbsent: [^ nil])