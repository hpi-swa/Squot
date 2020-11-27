tests unloaded artifacts
testPatchUnloadedArtifact
	| object snapshot patch |
	object := ValueHolder new contents: 1; yourself.
	snapshot := SquotImageStore new add: object at: 'obj'; captureSnapshot.
	workingCopy addUnloaded: (snapshot artifactAt: 'obj').
	self deny: (store includes: object);
		deny: (workingCopy patchRelativeToBase: snapshot) hasChanges.
	object contents: 2.
	snapshot := SquotImageStore new add: object at: 'obj'; captureSnapshot.
	patch := snapshot patchRelativeToBase: workingCopy.
	"when"
	workingCopy applyPatch: patch.
	"then"
	self deny: (snapshot patchRelativeToBase: workingCopy) hasChanges;
		deny: (workingCopy artifactAt: 'obj') isLoaded;
		deny: (store includesObjectAt: 'obj').