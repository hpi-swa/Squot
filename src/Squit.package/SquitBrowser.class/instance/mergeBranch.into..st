actions on branches
mergeBranch: aHistorian into: aWorkingCopy
	| mergeHeadCommit loadedPatch savePatch |
	mergeHeadCommit := aHistorian version.
	[loadedPatch := SquotGUI waitFor: (aWorkingCopy newInteractiveMergeOperation
		mergeVersion: mergeHeadCommit;
		title: 'Merge branch ', aHistorian shortName;
		prepare;
		applyToWorkingCopy)]
		on: SquotVersionAlreadyInHistory do:
			[self inform: 'Already on branch ', aWorkingCopy loadedHistorian shortName, ': ', mergeHeadCommit.
			^ nil]
		on: BrokenPromise "cancelled" do: [^ nil].
	aWorkingCopy addParentVersion: mergeHeadCommit.
	aWorkingCopy additionalParents size > 0 ifFalse: [self inform: 'Adopted ', aHistorian version. ^ self].
	savePatch := aWorkingCopy baseVersion newPatchBuilder.
	loadedPatch diffsDo: [:each | savePatch addDiff: each].
	[SquotGUI waitFor:
		(aWorkingCopy newInteractiveSaveOperation
			title: 'Save the merge of ', aHistorian shortName;
			message: (aHistorian messageWhenMergingInto: aWorkingCopy loadedHistorian);
			patch: savePatch buildPatch;
			applyToWorkingCopy)]
		on: BrokenPromise "cancelled" do: [^ nil].
	Project current addDeferredUIMessage: [self selectActiveHistorian].