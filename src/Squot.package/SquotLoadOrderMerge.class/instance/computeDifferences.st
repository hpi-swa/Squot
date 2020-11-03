private
computeDifferences
	self detectContainerModifications;
		resetAppliedDiffs.
	self privateResolvedPatch. self flag: #todo. "looks strange"