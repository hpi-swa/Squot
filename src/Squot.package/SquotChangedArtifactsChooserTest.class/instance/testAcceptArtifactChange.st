testing
testAcceptArtifactChange
	| path patch acceptReturned |
	path := 'changed-artifact'.
	patch := SquotPatch builder addDiff: (SquotArtifactDiffMock path: path); buildPatch.
	tool := self newToolOn: patch.
	self assert: tool rootNodes size = 1.
	self closeDialogPossiblyOpenedDuring: [tool accept. acceptReturned := true]
		timeoutMsecs: 5.
	self assert: acceptReturned == true.
	self assert: (tool selectedPatch diffAt: path) = (patch diffAt: path).