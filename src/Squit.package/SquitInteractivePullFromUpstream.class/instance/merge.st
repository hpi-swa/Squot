private
merge
	[patchLoadedDuringMerge := SquotGUI waitFor:
		(self workingCopy newInteractiveMergeOperation
			mergeVersion: (localHistorian upstreamVersion ifNil:
								[self inform: 'Upstream branch ''', localHistorian upstreamHistorianName, ''' does not exist.'. ^ nil]);
			title: localHistorian upstreamMergeMessage;
			prepare;
			applyToWorkingCopy)]
		on: SquotVersionAlreadyInHistory do:
			[self inform: 'Already on branch ', localHistorian shortName, ': ', localHistorian upstreamVersion.
			^ nil]
		on: BrokenPromise "cancelled" do:
			[:e | e ifNotError: [^ nil]].