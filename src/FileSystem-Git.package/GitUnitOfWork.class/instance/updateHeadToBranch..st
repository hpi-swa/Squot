branches and tags
updateHeadToBranch: branchName
"Updates the reference in 'HEAD' to branchName"
	| fullBranchRef |
	fullBranchRef := 'refs/heads/', branchName.
	self updateHeadToRef: fullBranchRef message: 'Update HEAD to ', branchName.