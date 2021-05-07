branches and tags
updateHeadToBranch: branchName
"Updates the reference in 'HEAD' to branchName"
	| fullBranchRef |
	fullBranchRef := 'refs/heads/', branchName.
	(self reflogForReference: 'HEAD')
		logUpdateFrom: (self headRef ifNil: [0 asHexHash])
		to: (self resolveRef: fullBranchRef)
		by: GitStamp now
		message: 'Update HEAD to ', branchName.
	self basicUpdateRef: 'HEAD' to: 'ref: ' , fullBranchRef.