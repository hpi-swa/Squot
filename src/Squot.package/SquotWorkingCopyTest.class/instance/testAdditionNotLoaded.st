tests unloaded artifacts
testAdditionNotLoaded
	| text snapshot patchBuilder patch |
	text := Text fromString: 'Some text'.
	snapshot := SquotImageStore new add: text at: 'text.txt'; captureSnapshot.
	patchBuilder := (snapshot patchRelativeToBase: workingCopy) createNewBuilder.
	(patchBuilder diffAt: 'text.txt') toggleWhetherToLoad.
	patch := patchBuilder updateRightArtifacts; buildPatch.
	self deny: (workingCopy includesObjectAt: 'text.txt');
		deny: (workingCopy loadOrder includes: 'text.txt').
	"when"
	workingCopy applyPatch: patch.
	"then"
	self assert: (workingCopy includesObjectAt: 'text.txt');
		deny: (workingCopy artifactAt: 'text.txt') isLoaded;
		deny: (store includesObjectAt: 'text.txt');
		deny: (workingCopy patchRelativeToBase: snapshot) hasChanges;
		assert: (workingCopy loadOrder includes: 'text.txt').