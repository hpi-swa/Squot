testing
testRejectArtifactAddition
	| path artifact patch acceptReturned |
	path := 'conflicted-artifact'.
	artifact := SquotArtifact new path: path; content: SquotArtifactContentMock new.
	patch := SquotPatch builder addArtifact: artifact; buildPatch.
	tool := self newToolOn: patch.
	self assert: tool rootNodes size = 1.
	tool selectNode: tool rootNodes first children first.
	tool deactivateSelectedNode.
	self closeDialogPossiblyOpenedDuring: [tool accept. acceptReturned := true]
		timeoutMsecs: 5.
	self assert: acceptReturned == true.
	self deny: (tool selectedPatch includesDiffAt: path).