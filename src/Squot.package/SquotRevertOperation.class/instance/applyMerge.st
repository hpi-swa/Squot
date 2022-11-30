applying
applyMerge
	"Execute the merge and answer the applied patch."
	^ loadedPatch :=
		merge
			applyToWorkingCopy;
			appliedPatch