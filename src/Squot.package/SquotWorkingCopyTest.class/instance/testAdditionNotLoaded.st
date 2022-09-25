tests unloaded artifacts
testAdditionNotLoaded
	| text snapshot patchBuilder patch |
	text := Text fromString: 'Some text'.
	snapshot := self captureProjectWith: text atPath: 'text.txt'.
	SquotToggles useNewApi
		ifTrue:
			[workingCopy useStoreImplementation: SquotSnapshotStore forArtifact: snapshot project artifacts anyOne.
			patch := snapshot patchRelativeToBase: (SquotProjectSnapshot fromStore: workingCopy)]
		ifFalse:
			[patchBuilder := (snapshot patchRelativeToBase: workingCopy) createNewBuilder.
			(patchBuilder diffAt: 'text.txt') toggleWhetherToLoad.
			patch := patchBuilder updateRightArtifacts; buildPatch].
	self deny: (workingCopy includesObjectAt: 'text.txt');
		deny: (workingCopy loadOrder includes: 'text.txt').
	"when"
	workingCopy applyPatch: patch.
	"then"
	self assert: (workingCopy includesObjectAt: 'text.txt');
		deny: (workingCopy isArtifactLoaded: (workingCopy artifactAt: 'text.txt'));
		deny: (store includesObjectAt: 'text.txt');
		deny: (workingCopy patchRelativeToBase: snapshot) hasChanges.
	SquotToggles useNewApi
		ifTrue:
			[| artifact |
			artifact := snapshot project artifacts anyOne.
			self assert: (workingCopy project artifacts includesKey: artifact id);
				assert: (workingCopy project artifacts at: artifact id) id = artifact id]
		ifFalse:
			[self assert: (workingCopy loadOrder includes: 'text.txt');
				assert: (snapshot artifactAt: 'text.txt') id equals: (workingCopy artifactAt: 'text.txt') id].