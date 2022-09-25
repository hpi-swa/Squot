tests unloaded artifacts
testPatchAndLoadUnloadedArtifact
	| object snapshot store patch |
	object := ValueHolder new contents: 1; yourself.
	store := self newWorkingCopy.
	snapshot := store add: object at: 'obj'; snapshot.
	workingCopy addUnloaded: (snapshot artifactAt: 'obj').
	object contents: 2.
	snapshot := store snapshot.
	patch := snapshot patchRelativeToBase: workingCopy.
	workingCopy toggleWhetherToLoad: (patch diffAt: 'obj').
	SquotToggles useNewApi ifTrue: [patch updateResult].
	"when"
	workingCopy applyPatch: patch.
	"then"
	self deny: (snapshot patchRelativeToBase: workingCopy) hasChanges;
		assert: (workingCopy artifactAt: 'obj') isLoaded;
		assert: (store includesObjectAt: 'obj');
		assert: 2 equals: (store objectAt: 'obj') contents;
		assert: (snapshot artifactAt: 'obj') id equals: (workingCopy artifactAt: 'obj') id.