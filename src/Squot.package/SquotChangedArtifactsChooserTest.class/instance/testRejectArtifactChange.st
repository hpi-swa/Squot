testing
testRejectArtifactChange
	| path patch acceptReturned |
	path := 'changed-artifact'.
	patch := SquotPatch builder addDiff: SquotArtifactDiffMock new; buildPatch.
	tool := self newToolOn: patch.
	self assert: tool rootNodes size = 1.
	tool selectNode: tool rootNodes first.
	tool deactivateSelectedNode.
	self closeDialogPossiblyOpenedDuring: [tool accept. acceptReturned := true]
		timeoutMsecs: 5.
	self assert: acceptReturned == true.
	self deny: (tool selectedPatch includesDiffAt: path).