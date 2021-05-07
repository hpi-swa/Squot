accessing
branchNamed: aString
	^ self filesystemOn: (self unitOfWork branchNamed: aString)