tests unloaded artifacts
testToggleLoadAddedArtifact
	| path acceptReturned mock |
	path := 'conflicted-artifact'.
	tool := self newToolOn: (self patchAddingArtifactAt: path).
	tool selectNode: tool rootNodes first.
	self assert: (self treeViewMenuIncludesAction: #toggleLoadSelectedNode).
	tool toggleLoadSelectedNode;
		toggleLoadSelectedNode.
	self deny: ('do not load *' match: (tool nodeLabelOf: tool selectedNode) asString).
	self closeDialogPossiblyOpenedDuring: [tool accept. acceptReturned := true]
		timeoutMsecs: 5.
	self assert: acceptReturned == true.
	self assert: (self resultIncludesDiffAt: path);
		assert: (self resultDiffAt: path) isAddition.
	(self resultDiffAt: path) applyToContainer: (mock := SquotMock new).
	self assert: (mock hasReceivedMessageWithSelector: #add:).