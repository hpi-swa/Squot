tests
testAcceptArtifactChange
	| path patch acceptReturned |
	path := 'changed-artifact'.
	tool := self newToolOn: (patch := self patchChangingArtifactAt: path).
	self assert: tool rootNodes size = 1.
	tool rootNodes first include.
	self closeDialogPossiblyOpenedDuring: [tool accept. acceptReturned := true]
		timeoutMsecs: 5.
	self assert: acceptReturned == true.
	self assert: (self resultDiffAt: path) isModification.