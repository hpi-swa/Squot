accessing
branchNamed: aString
	^ self filesystemOn: (repository branchNamed: aString)