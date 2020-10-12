tests unloaded artifacts
testDiscardUnsavedChangeToUnloadedArtifact
	| object firstSnapshot secondSnapshot patch |
	object := ValueHolder new contents: 1; yourself.
	firstSnapshot := SquotImageStore new add: object at: 'obj'; captureSnapshot.
	workingCopy addUnloaded: (firstSnapshot artifactAt: 'obj').
	workingCopy saveVersionWithMessage: 'add obj'.
	firstSnapshot := workingCopy baseVersion snapshot. "Repository might add objects automatically."
	object contents: 2.
	secondSnapshot := SquotImageStore new add: object at: 'obj'; captureSnapshot.
	patch := secondSnapshot patchRelativeToBase: workingCopy.
	workingCopy applyPatch: patch.
	"when"
	workingCopy discardUnsavedChanges.
	"then"
	self deny: (firstSnapshot patchRelativeToBase: workingCopy) hasChanges;
		deny: (workingCopy artifactAt: 'obj') isLoaded;
		deny: (store includesObjectAt: 'obj').