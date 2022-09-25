applying
prepareSave
	| patchBuilder |
	SquotToggles useNewApi ifTrue:
		[^ self withUnitOfWorkActive:
			[| revertMerge baseSnapshot mergeForNewVersion |
			revertMerge := merge "operation" merge "that reverts the changes".
			baseSnapshot := self workingCopy baseVersion snapshot.
			mergeForNewVersion := SquotProjectMerge base: baseSnapshot working: baseSnapshot incoming: (SquotProjectSnapshot fromStore: self workingCopy)
				merges: (revertMerge elementMerges collect: [:each | each rebaseOn: (baseSnapshot snapshotArtifact: (baseSnapshot artifactAt: each working artifact id))])
				additions: revertMerge additions
				removals: revertMerge removals
				conflicts: #()
				loadOrderMerge: (revertMerge loadOrderMerge rebaseOn: baseSnapshot artifacts keys)
				metadataMerge: (revertMerge metadataMerge rebaseOn: (SquotTrackedObjectMetadata newFrom: baseSnapshot project metadata)).
			save := self privateNewSave
				message: (message ifNil: [self defaultMessage]);
				patch: mergeForNewVersion;
				unitOfWork: self unitOfWork;
				yourself]].
	^ self withUnitOfWorkActive:
	[patchBuilder := self workingCopy baseVersion newPatchBuilder.
	loadedPatch diffsDo: [:each | each hasChanges ifTrue: [patchBuilder addDiff: each]].
	save := self privateNewSave
		message: (message ifNil: [self defaultMessage]);
		patch: (patchBuilder updateRightArtifacts; buildPatch);
		unitOfWork: self unitOfWork;
		yourself]