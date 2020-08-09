actions on branches
mergeCommit: aVersion into: aWorkingCopy mergeTitle: mergeString saveTitle: saveString saveMessageTemplate: messageString
	| loadedPatch savePatch |
	[loadedPatch := SquotGUI waitFor: (aWorkingCopy newInteractiveMergeOperation
		mergeVersion: aVersion;
		title: mergeString;
		prepare;
		applyToWorkingCopy)]
		on: SquotVersionAlreadyInHistory do:
			[self inform: 'Already on branch ', aWorkingCopy loadedHistorian shortName, ': ', aVersion.
			^ nil]
		on: BrokenPromise "cancelled" do: [:e | e ifNotError: [^ nil]].
	aWorkingCopy addParentVersion: aVersion.
	aWorkingCopy additionalParents size > 0 ifFalse: [self inform: 'Adopted ', aVersion. ^ self].
	savePatch := aWorkingCopy baseVersion newPatchBuilder.
	loadedPatch diffsDo: [:each | savePatch addDiff: each].
	[SquotGUI waitFor:
		(aWorkingCopy newInteractiveSaveOperation
			title: saveString;
			message: messageString;
			patch: savePatch buildPatch;
			applyToWorkingCopy)]
		on: BrokenPromise "cancelled" do: [:e | e ifNotError: [^ nil]].
	Project current addDeferredUIMessage: [self selectActiveHistorian].