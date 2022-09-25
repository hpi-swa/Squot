applying
prepareSave
	| patchBuilder |
	SquotToggles useNewApi ifTrue:
		[^ self withUnitOfWorkActive: 
			[| pickMerge baseSnapshot mergeForNewVersion |
			pickMerge := merge "operation" merge "of the cherry-picking".
			baseSnapshot := self workingCopy baseVersion snapshot.
			mergeForNewVersion := SquotProjectMerge base: baseSnapshot working: baseSnapshot incoming: (SquotProjectSnapshot fromStore: self workingCopy) merges: (pickMerge elementMerges collect: [:each | each rebaseOn: (baseSnapshot snapshotArtifact: (baseSnapshot artifactAt: each working artifact id))]) additions: pickMerge additions removals: pickMerge removals conflicts: #() loadOrderMerge: (pickMerge loadOrderMerge rebaseOn: baseSnapshot artifacts keys) metadataMerge: (pickMerge metadataMerge rebaseOn: (SquotTrackedObjectMetadata newFrom: baseSnapshot project metadata)).
			save := self privateNewSave
				message: (message ifNil: [self defaultMessage]);
				patch: mergeForNewVersion;
				author: pickedVersion author;
				timestamp: pickedVersion timestamp;
				unitOfWork: self unitOfWork;
				yourself]].
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