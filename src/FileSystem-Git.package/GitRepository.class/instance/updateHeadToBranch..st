public-accessing-references
updateHeadToBranch: branchName
"Updates the reference in 'HEAD' to branchName"
	self privateDeprecatedUseUnitOfWork.

	self basicUpdateRef: 'HEAD' to: 'ref: refs/heads/' , branchName