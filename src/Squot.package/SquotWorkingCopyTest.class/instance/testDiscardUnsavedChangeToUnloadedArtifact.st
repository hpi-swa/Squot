tests unloaded artifacts
testDiscardUnsavedChangeToUnloadedArtifact
	| object helperWorkingCopy firstSnapshot secondSnapshot patch |
	object := ValueHolder new contents: 1; yourself.
	helperWorkingCopy := self newWorkingCopy.
	helperWorkingCopy add: object at: 'obj'.
	firstSnapshot := helperWorkingCopy snapshot.
	workingCopy addUnloaded: (firstSnapshot artifactAt: 'obj').
	workingCopy saveVersionWithMessage: 'add obj'.
	self denyChangesInWorkingCopy.
	repository withUnitOfWork:
		[firstSnapshot := workingCopy baseVersion snapshot. "Repository might add objects automatically."].
	object contents: 2.
	secondSnapshot := helperWorkingCopy snapshot.
	patch := secondSnapshot patchRelativeToBase: workingCopy.
	workingCopy applyPatch: patch.
	"when"
	workingCopy discardUnsavedChanges.
	"then"
	self deny: (workingCopy patchRelativeToBase: firstSnapshot) hasChanges;
		deny: (workingCopy artifactAt: 'obj') isLoaded;
		deny: (store includesObjectAt: 'obj').