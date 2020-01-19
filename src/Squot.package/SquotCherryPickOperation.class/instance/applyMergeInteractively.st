*Squot-Tools applying
applyMergeInteractively
	^ merge applyToWorkingCopyInteractively
		then: [:ignored | loadedPatch := merge appliedPatch]