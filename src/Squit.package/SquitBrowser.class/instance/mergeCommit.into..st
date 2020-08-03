actions on versions
mergeCommit: aVersion into: aWorkingCopy
	| loadedPatch savePatch |
	[loadedPatch := SquotGUI waitFor: (aWorkingCopy newInteractiveMergeOperation
		mergeVersion: aVersion;
		title: 'Merge ', aVersion;
		prepare;
		applyToWorkingCopy)]
		on: SquotVersionAlreadyInHistory do:
			[self inform: 'Already on branch ', aWorkingCopy loadedHistorian shortName, ': ', aVersion.
			^ nil]
		on: BrokenPromise "cancelled" do: [^ nil].
	aWorkingCopy addParentVersion: aVersion.
	aWorkingCopy additionalParents size > 0 ifFalse: [self inform: 'Adopted ', aVersion. ^ self].
	savePatch := aWorkingCopy baseVersion newPatchBuilder.
	loadedPatch diffsDo: [:each | savePatch addDiff: each].
	[SquotGUI waitFor:
		(aWorkingCopy newInteractiveSaveOperation
			title: 'Save the merge of ', aVersion;
			message: ('Merge commit ', aVersion internalId, ' into ', aWorkingCopy loadedHistorian shortName);
			patch: savePatch buildPatch;
			applyToWorkingCopy)]
		on: BrokenPromise "cancelled" do: [^ nil].
	Project current addDeferredUIMessage: [self selectActiveHistorian].