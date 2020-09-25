tests
testAcceptArtifactAddition
	| path acceptReturned |
	path := 'conflicted-artifact'.
	tool := self newToolOn: (self patchAddingArtifactAt: path).
	self assert: tool rootNodes size = 1.
	self closeDialogPossiblyOpenedDuring: [tool accept. acceptReturned := true]
		timeoutMsecs: 5.
	self assert: acceptReturned == true.
	self assert: (self resultDiffAt: path) isAddition.