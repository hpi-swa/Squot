tests unloaded artifacts
testLoadUnloadedArtifactDuringModification
	| path acceptReturned mock |
	path := 'artifact'.
	tool := self newToolOn: (self patchChangingUnloadedArtifactAt: path).
	tool selectNode: tool rootNodes first.
	self assert: ('*(*not loaded*)' match: (tool nodeLabelOf: tool selectedNode) asString);
		assert: (self treeViewMenuIncludesAction: #toggleLoadSelectedNode).
	tool toggleLoadSelectedNode.
	self assert: ('load *(*currently unloaded*)' match: (tool nodeLabelOf: tool selectedNode) asString);
		assert: (self treeViewMenuIncludesAction: #toggleLoadSelectedNode).
	self closeDialogPossiblyOpenedDuring: [tool accept. acceptReturned := true]
		timeoutMsecs: 5.
	self assert: acceptReturned == true.
	self assert: (self resultIncludesDiffAt: path);
		assert: (self resultDiffAt: path) isModification;
		assert: (self resultDiffAt: path) willBeLoaded.
	(self resultDiffAt: path) applyToContainer: (mock := SquotMock new).
	self assert: (mock hasReceivedMessageWithSelector: #applyDiff:toObjectAt:).