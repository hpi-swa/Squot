tests unloaded artifacts
testPatchUnloadedArtifact
	| object helperWorkingCopy snapshot patch |
	object := ValueHolder new contents: 1; yourself.
	helperWorkingCopy := self newWorkingCopy.
	helperWorkingCopy add: object at: 'obj'.
	snapshot := helperWorkingCopy snapshot.
	workingCopy addUnloaded: (snapshot artifactAt: 'obj').
	self deny: (store includes: object);
		deny: (workingCopy patchRelativeToBase: snapshot) hasChanges.
	object contents: 2.
	snapshot := helperWorkingCopy snapshot.
	patch := snapshot patchRelativeToBase: workingCopy.
	"when"
	workingCopy applyPatch: patch.
	"then"
	self deny: (snapshot patchRelativeToBase: workingCopy) hasChanges;
		deny: (workingCopy artifactAt: 'obj') isLoaded;
		deny: (store includesObjectAt: 'obj').