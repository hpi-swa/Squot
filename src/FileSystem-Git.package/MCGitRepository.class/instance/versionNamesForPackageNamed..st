versions
versionNamesForPackageNamed: aString 
	^ self readableFileNames select: [:each |
		(each startsWith: aString) and: [(each at: aString size + 1) isAlphaNumeric not] ]