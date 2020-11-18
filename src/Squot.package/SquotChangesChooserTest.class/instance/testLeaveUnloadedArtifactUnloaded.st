tests unloaded artifacts
testLeaveUnloadedArtifactUnloaded
	| path acceptReturned |
	workingCopy := SquotWorkingCopy forTestInMemory.
	path := 'artifact'.
	tool := self newToolOn: (self patchWithUnloadedArtifactAt: path).
	tool selectNode: tool rootNodes first.
	self deny: tool selectedNode content willBeLoaded "not by default";
		assert: (self treeViewMenuIncludesAction: #toggleLoadSelectedNode).
	self closeDialogPossiblyOpenedDuring: [tool accept. acceptReturned := true]
		timeoutMsecs: 5.
	self assert: acceptReturned == true.
	workingCopy applyPatch: tool selectedPatch.
	self deny: (workingCopy artifactAt: path) isLoaded.