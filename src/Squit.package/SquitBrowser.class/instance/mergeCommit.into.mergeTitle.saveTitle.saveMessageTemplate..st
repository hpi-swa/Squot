actions on branches
mergeCommit: aVersion into: aWorkingCopy mergeTitle: mergeString saveTitle: saveString saveMessageTemplate: messageString
	[SquotGUI waitFor: (aWorkingCopy newInteractiveMergeOperation
		mergeVersion: aVersion;
		title: mergeString;
		prepare;
		applyToWorkingCopy)]
		on: SquotVersionAlreadyInHistory do:
			[self inform: 'Already on branch ', aWorkingCopy loadedHistorian shortName, ': ', aVersion.
			^ nil]
		on: BrokenPromise "cancelled" do: [:e | e ifNotError: [^ nil]].
	aWorkingCopy loadedVersion = aVersion ifTrue: [self inform: 'Updated ', aWorkingCopy loadedHistorian shortName, ' to ', aVersion. ^ self].
	self flag: #todo. "Try to exclude changes that were already unsaved in the working copy before the merge."
	[SquotGUI waitFor:
		(aWorkingCopy newInteractiveSaveOperation
			title: saveString;
			message: messageString;
			applyToWorkingCopy)]
		on: BrokenPromise "cancelled" do: [:e | e ifNotError: [^ nil]].
	Project current addDeferredUIMessage: [self selectActiveHistorian].