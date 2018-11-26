testing
testAcceptArtifactRemoval
	| path artifact patch acceptReturned |
	path := 'removed-artifact'.
	artifact := SquotArtifact new path: path; content: SquotArtifactContentMock new.
	patch := SquotPatch builder removeArtifact: artifact; buildPatch.
	tool := self newToolOn: patch.
	self assert: tool rootNodes size = 1.
	self closeDialogPossiblyOpenedDuring: [tool accept. acceptReturned := true]
		timeoutMsecs: 5.
	self assert: acceptReturned == true.
	self assert: (tool selectedPatch diffAt: path) isRemoval.