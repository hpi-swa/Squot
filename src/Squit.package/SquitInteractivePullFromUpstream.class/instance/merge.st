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
			^ nil].
	self workingCopy addParentVersion: localHistorian upstreamVersion.