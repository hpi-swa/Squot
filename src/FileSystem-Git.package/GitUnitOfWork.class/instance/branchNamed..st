accessing
branchNamed: aString
	repository validateReferenceOrReferenceName: aString.
	^ self objectNamed: (self resolveRef: 'refs/heads/', aString)