tests unloaded artifacts
testLoadUnloadedArtifact
	| path acceptReturned |
	workingCopy := SquotWorkingCopy forTestInMemory.
	path := 'artifact'.
	tool := self newToolOn: (self patchWithUnloadedArtifactAt: path).
	tool selectNode: tool rootNodes first.
	self assert: ('( * )' match: (tool nodeLabelOf: tool selectedNode) asString);
		assert: (self treeViewMenuIncludesAction: #toggleLoadSelectedNode).
	tool toggleLoadSelectedNode.
	self assert: ('load *(*unchanged*)' match: (tool nodeLabelOf: tool selectedNode) asString);
		assert: (self treeViewMenuIncludesAction: #toggleLoadSelectedNode).
	self closeDialogPossiblyOpenedDuring: [tool accept. acceptReturned := true]
		timeoutMsecs: 5.
	self assert: acceptReturned == true.
	self assert: (self resultIncludesDiffAt: path);
		assert: (self resultDiffAt: path) willBeLoaded.
	(self resultDiffAt: path) applyToContainer: workingCopy.
	self assert: (workingCopy artifactAt: path) isLoaded;
		assert: (workingCopy store includesObjectAt: path).