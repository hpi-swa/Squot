refs
createBranchNamed: aString at: aCommit
	| refName target |
	refName := self branchName: aString.
	target := aCommit hexHash.
	self unitOfWork updateRef: refName to: target message: 'branch: Created from ', target.
	^ refName