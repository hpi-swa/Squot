public-accessing-references
updateHeadToBranch: branchName
"Updates the reference in 'HEAD' to branchName"
	| fullBranchRef resolvedHash |
	self privateDeprecatedUseUnitOfWork.

	fullBranchRef := 'refs/heads/', branchName.
	resolvedHash := self resolveRef: fullBranchRef.
	resolvedHash ifNotNil:
		[(self reflogForReference: 'HEAD')
			logUpdateFrom: (self headRef ifNil: [0 asHexHash])
			to: resolvedHash
			by: GitStamp now
			message: 'Update HEAD to ', branchName].
	self basicUpdateRef: 'HEAD' to: 'ref: ' , fullBranchRef.