applying
prepareSave
	| patchBuilder |
	^ self withUnitOfWorkActive:
	[patchBuilder := self workingCopy baseVersion newPatchBuilder.
	loadedPatch diffsDo: [:each | each hasChanges ifTrue: [patchBuilder addDiff: each]].
	save := self privateNewSave
		message: (message ifNil: [self defaultMessage]);
		patch: (patchBuilder updateRightArtifacts; buildPatch);
		author: pickedVersion author;
		timestamp: pickedVersion timestamp;
		unitOfWork: self unitOfWork;
		yourself]