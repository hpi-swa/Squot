testing
testRejectArtifactRemoval
	| path artifact patch acceptReturned |
	path := 'removed-artifact'.
	artifact := SquotArtifact new path: path; content: SquotArtifactContentMock new.
	patch := SquotPatch builder removeArtifact: artifact; buildPatch.
	tool := self newToolOn: patch.
	self assert: tool rootNodes size = 1.
	tool selectNode: tool rootNodes first.
	tool deactivateSelectedNode.
	self closeDialogPossiblyOpenedDuring: [tool accept. acceptReturned := true]
		timeoutMsecs: 5.
	self assert: acceptReturned == true.
	self deny: (tool selectedPatch includesDiffAt: path).