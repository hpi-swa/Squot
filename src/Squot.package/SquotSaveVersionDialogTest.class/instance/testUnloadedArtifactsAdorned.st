tests unloaded artifacts
testUnloadedArtifactsAdorned
	| store patch |
	store := SquotImageStore new.
	store add: (ValueHolder new contents: 1) at: 'changed'.
	workingCopy
		addUnloaded: (store artifactAt: 'changed') capture;
		saveVersionWithMessage: 'Add artifact'.
	(store objectAt: 'changed') contents: 2.
	workingCopy applyDiff: (((workingCopy artifactAt: 'changed') diffAgainst: (store artifactAt: 'changed'))).
	patch := workingCopy lazySnapshot patchRelativeToBase: workingCopy baseVersion.
	tool := self newToolOn: patch.
	tool selectNode: tool rootNodes first.
	self assert: ('*(*not loaded*)' match: (tool nodeLabelOf: tool selectedNode) asString).