as yet unclassified
testRejectArtifactAddition
	| path artifact diffs patch acceptReturned
	 |
	path := 'conflicted-artifact'.
	artifact := SquotArtifact new path: path; content: SquotArtifactContentMock new.
	diffs := Dictionary new
		add: path -> (SquotArtifactAddition of: artifact);
		yourself.
	patch := SquotPatch with: diffs.
	selectionTool := SquotChangedArtifactsChooser on: patch.
	self assert: selectionTool rootNodes size = 1.
	selectionTool selectNode: selectionTool rootNodes first children first.
	selectionTool deactivateSelectedNode.
	self closeDialogPossiblyOpenedDuring: [selectionTool accept. acceptReturned := true]
		timeoutMsecs: 5.
	self assert: acceptReturned == true.
	self deny: (selectionTool selectedPatch includesDiffAt: path).