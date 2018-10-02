testing
testAcceptArtifactAddition
	| path artifact patch acceptReturned |
	path := 'conflicted-artifact'.
	artifact := SquotArtifact new path: path; content: SquotArtifactContentMock new.
	patch := SquotPatch builder addArtifact: artifact; buildPatch.
	selectionTool := self newToolOn: patch.
	self assert: selectionTool rootNodes size = 1.
	self closeDialogPossiblyOpenedDuring: [selectionTool accept. acceptReturned := true]
		timeoutMsecs: 5.
	self assert: acceptReturned == true.
	self assert: (selectionTool selectedPatch diffAt: path) class == SquotArtifactAddition.