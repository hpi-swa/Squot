actions on branches
pullUpstream: aWorkingCopy
	| localHistorian patch savePatch |
	localHistorian := aWorkingCopy loadedHistorian.
	[self handleRemoteErrorsWhile:
		[self handlingCredentialsOf: aWorkingCopy repository
			do: [localHistorian importFromUpstream]
			ifCanceled: [^ self]]
		afterErrorDo: [^ self]]
		on: SquitUpstreamUndefined do:
			[self inform: localHistorian shortName, ' has no upstream branch. Please set one, then pull again.'.
			Project current addDeferredUIMessage: [self actionSetUpstreamBranch].
			^ self].
	[patch := SquotGUI waitFor:
		(aWorkingCopy newInteractiveMergeOperation
			mergeVersion: localHistorian upstreamVersion;
			title: localHistorian upstreamMergeMessage;
			prepare;
			applyToWorkingCopy)]
		on: SquotVersionAlreadyInHistory do:
			[^ self inform: 'Already on branch ', localHistorian shortName, ': ', localHistorian upstreamVersion].
	aWorkingCopy addParentVersion: localHistorian upstreamVersion.
	aWorkingCopy additionalParents size > 0
		ifTrue:
			[savePatch := aWorkingCopy baseVersion newPatchBuilder.
			patch diffsDo: [:each | savePatch addDiff: each].
			SquotGUI waitFor:
				(aWorkingCopy newInteractiveSaveOperation
					title: 'Save the merge of ', localHistorian upstreamTrackingHistorian shortName;
					patch: savePatch buildPatch;
					applyToWorkingCopy)]
		ifFalse:
			[self inform: 'Adopted ', localHistorian upstreamVersion].
	^ Project current addDeferredUIMessage: [self refresh; selectActiveHistorian]