tests unloaded artifacts
testLeaveUnloadedArtifactUnloaded
	"Unloaded artifacts should not appear if they are not changed. If they are changed, they stay unloaded while saving."
	| store artifact path patch acceptReturned |
	workingCopy := SquotWorkingCopy forTestInMemory.
	path := 'artifact'.
	artifact := SquotArtifactMock path: path.
	artifact whenComparedWith: artifact return: [SquotDiffOfEqualObjects instance].
	store := SquotImageStore new.
	store add: (ValueHolder new contents: 1) at: 'changed'.
	workingCopy addUnloaded: artifact;
		addUnloaded: (store artifactAt: 'changed') capture;
		saveVersionWithMessage: 'Add artifact'.
	(store objectAt: 'changed') contents: 2.
	workingCopy applyDiff: (((workingCopy artifactAt: 'changed') diffAgainst: (store artifactAt: 'changed'))).
	patch := workingCopy lazySnapshot patchRelativeToBase: workingCopy baseVersion.
	tool := self newToolOn: patch.
	self assert: (tool rootNodes noneSatisfy: [:each | each title asString includesSubstring: 'artifact']).
	tool selectNode: tool rootNodes first.
	self deny: (self treeViewMenuIncludesAction: #toggleLoadSelectedNode).
	self closeDialogPossiblyOpenedDuring: [tool accept. acceptReturned := true] timeoutMsecs: 5.
	self assert: acceptReturned == true.
	workingCopy newSaveOperation
		patch: tool selectedPatch;
		message: 'Change';
		applyToWorkingCopy.
	self deny: (workingCopy artifactAt: 'changed') isLoaded.