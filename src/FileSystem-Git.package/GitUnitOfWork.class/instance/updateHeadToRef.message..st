branches and tags
updateHeadToRef: ref message: aString
"Updates the reference in 'HEAD' to branchName"
	| fullBranchRef |
	fullBranchRef := ref.
	(self reflogForReference: 'HEAD')
		logUpdateFrom: (self headRef ifNil: [0 asHexHash])
		to: (self resolveRef: fullBranchRef)
		by: GitStamp now
		message: aString.
	self basicUpdateRef: 'HEAD' to: 'ref: ' , fullBranchRef.