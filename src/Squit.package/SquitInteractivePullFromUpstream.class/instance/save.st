private
save
	| savePatch |
	savePatch := self workingCopy baseVersion newPatchBuilder.
	patchLoadedDuringMerge diffsDo: [:each | savePatch addDiff: each].
	[SquotGUI waitFor:
		(self workingCopy newInteractiveSaveOperation
			title: 'Save the merge of ', localHistorian upstreamTrackingHistorian shortName;
			message: 'Merge branch ''', (localHistorian repository historianNamed: localHistorian upstreamHistorianName) shortName, ''' of ', localHistorian upstreamRemote url, ' into ', localHistorian shortName;
			patch: savePatch buildPatch;
			applyToWorkingCopy)]
		on: BrokenPromise "cancelled" do: [^ nil].