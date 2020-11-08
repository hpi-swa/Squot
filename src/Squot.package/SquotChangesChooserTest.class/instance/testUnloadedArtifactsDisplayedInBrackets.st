tests unloaded artifacts
testUnloadedArtifactsDisplayedInBrackets
	| path acceptReturned mock |
	path := 'artifact'.
	tool := self newToolOn: (self patchChangingUnloadedArtifactAt: path).
	tool selectNode: tool rootNodes first.
	self assert: ('( * )' match: (tool nodeLabelOf: tool selectedNode) asString).
	self closeDialogPossiblyOpenedDuring: [tool accept. acceptReturned := true]
		timeoutMsecs: 5.
	self assert: acceptReturned == true.
	self assert: (self resultIncludesDiffAt: path);
		assert: (self resultDiffAt: path) isModification.
	(self resultDiffAt: path) applyToContainer: (mock := SquotMock new).
	self assert: (mock hasReceivedMessageWithSelector: #applyDiff:toObjectAt:).