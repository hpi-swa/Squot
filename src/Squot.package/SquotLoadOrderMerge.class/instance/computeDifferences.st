private
computeDifferences
	self detectContainerModifications;
		resetAppliedDiffs.
	self resolvedPatch. self flag: #todo. "looks strange"