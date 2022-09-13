tests unloaded artifacts
testLeaveUnloadedArtifactUnloaded
	| path acceptReturned |
	path := 'artifact'.
	tool := self newToolOn: (self patchWithUnloadedArtifactAt: path).
	tool selectNode: tool rootNodes first.
	self deny: tool selectedNode content willBeLoaded "not by default";
		assert: (self treeViewMenuIncludesAction: #toggleLoadSelectedNode);
		assert: ('( * )' match: (tool nodeLabelOf: tool selectedNode)).
	self closeDialogPossiblyOpenedDuring: [tool accept. acceptReturned := true]
		timeoutMsecs: 5.
	self assert: acceptReturned == true.
	self applyToWorkingCopy.
	self deny: (workingCopy artifactAt: path) isLoaded.