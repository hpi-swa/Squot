tests unloaded artifacts
testRemovedUnsavedArtifactStaysRemoved
	"...and does not get readded as unloaded."
	| object snapshot secondVersion |
	object := ValueHolder new contents: 1; yourself.
	snapshot := SquotImageStore new add: object at: 'obj'; captureSnapshot.
	workingCopy add: (snapshot artifactAt: 'obj');
		saveVersionWithMessage: 'Add obj';
		removeAt: 'obj';
		add: object at: 'other path'.
	"when"
	repository withUnitOfWork: "to look up the baseVersion"
		[secondVersion := workingCopy newSaveOperation
			patch: (workingCopy baseVersion newPatchBuilder
						addDiff: ((workingCopy patchRelativeToBase: workingCopy baseVersion)
									diffAt: 'other path');
						buildPatch); "Diff at 'obj' not included!"
			message: 'Add at other path, but don''t remove at old path';
			applyToWorkingCopy].
	"then"
	self deny: (workingCopy includesObjectAt: 'obj');
		assert: (secondVersion includesObjectAt: 'obj').