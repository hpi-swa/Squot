private
merge
	[patchLoadedDuringMerge := SquotGUI waitFor:
		(self workingCopy newInteractiveMergeOperation
			mergeVersion: localHistorian upstreamVersion;
			title: localHistorian upstreamMergeMessage;
			prepare;
			applyToWorkingCopy)]
		on: SquotVersionAlreadyInHistory do:
			[self inform: 'Already on branch ', localHistorian shortName, ': ', localHistorian upstreamVersion.
			^ nil]
		on: BrokenPromise "cancelled" do:
			[^ nil].
	self workingCopy addParentVersion: localHistorian upstreamVersion.