tests
testRejectArtifactRemoval
	| path acceptReturned |
	path := 'removed-artifact'.
	tool := self newToolOn: (self patchRemovingArtifactAt: path).
	self assert: tool rootNodes size = 1.
	tool selectNode: tool rootNodes first.
	tool deactivateSelectedNode.
	self closeDialogPossiblyOpenedDuring: [tool accept. acceptReturned := true]
		timeoutMsecs: 5.
	self assert: acceptReturned == true.
	self deny: (self resultIncludesDiffAt: path).