tests unloaded artifacts
testRemovedUnsavedArtifactStaysRemoved
	"...and does not get readded as unloaded."
	| object helperWorkingCopy objId snapshot secondVersion |
	object := ValueHolder new contents: 1; yourself.
	helperWorkingCopy := self newWorkingCopy.
	helperWorkingCopy add: object at: 'obj'.
	objId := helperWorkingCopy idOfObject: object.
	snapshot := helperWorkingCopy snapshot.
	helperWorkingCopy := nil.
	workingCopy add: (snapshot artifactAt: 'obj');
		saveVersionWithMessage: 'Add obj';
		removeAt: 'obj';
		add: object at: 'other path'.
	"when"
	repository withUnitOfWork: "to look up the baseVersion"
		[| patch |
		patch := SquotToggles useNewApi
			ifTrue:
				[| merge |
				merge := (SquotProjectSnapshot fromStore: workingCopy) patchRelativeToBase: workingCopy baseVersion snapshot.
				merge removeModificationAt: objId;
					updateResult;
					yourself]
			ifFalse:
				[workingCopy baseVersion newPatchBuilder
					addDiff: ((workingCopy patchRelativeToBase: workingCopy baseVersion)
								diffAt: 'other path');
					updateRightArtifacts; 
					buildPatch]. "Diff at 'obj' not included!"
		secondVersion := workingCopy newSaveOperation
			patch: patch; 
			message: 'Add at other path, but don''t remove at old path';
			applyToWorkingCopy].
	"then"
	self deny: (workingCopy includesObjectAt: objId);
		assert: (secondVersion includesObjectAt: objId).