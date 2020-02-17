accessing
setUpstreamRefOfBranchNamed: branchName to: aString
	repository validateReferenceOrReferenceName: aString.
	^ self configAt: 'branch.', branchName, '.merge' put: aString