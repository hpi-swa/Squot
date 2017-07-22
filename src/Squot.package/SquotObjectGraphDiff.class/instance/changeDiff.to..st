Squot-diff-manipulation
changeDiff: existingDiff to: newDiff
	| nameOfChangedObject |
	nameOfChangedObject := diffs keyAtValue: existingDiff.
	diffs at: nameOfChangedObject put: newDiff. "keep it even if it has no changes, so it can be switched back on later"