tests
testAcceptArtifactRemoval
	| path acceptReturned |
	path := 'removed-artifact'.
	tool := self newToolOn: (self patchRemovingArtifactAt: path).
	self assert: tool rootNodes size = 1.
	self closeDialogPossiblyOpenedDuring: [tool accept. acceptReturned := true]
		timeoutMsecs: 5.
	self assert: acceptReturned == true.
	self assert: (self resultDiffAt: path) isRemoval.