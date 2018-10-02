testing
testRejectArtifactAddition
	| path artifact patch acceptReturned |
	path := 'conflicted-artifact'.
	artifact := SquotArtifact new path: path; content: SquotArtifactContentMock new.
	patch := SquotPatch builder addArtifact: artifact; buildPatch.
	selectionTool := self newToolOn: patch.
	self assert: selectionTool rootNodes size = 1.
	selectionTool selectNode: selectionTool rootNodes first children first.
	selectionTool deactivateSelectedNode.
	self closeDialogPossiblyOpenedDuring: [selectionTool accept. acceptReturned := true]
		timeoutMsecs: 5.
	self assert: acceptReturned == true.
	self deny: (selectionTool selectedPatch includesDiffAt: path).