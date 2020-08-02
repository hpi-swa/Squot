private
save
	| savePatch |
	savePatch := self workingCopy baseVersion newPatchBuilder.
	patchLoadedDuringMerge diffsDo: [:each | savePatch addDiff: each].
	SquotGUI waitFor:
		(self workingCopy newInteractiveSaveOperation
			title: 'Save the merge of ', localHistorian upstreamTrackingHistorian shortName;
			patch: savePatch buildPatch;
			applyToWorkingCopy).