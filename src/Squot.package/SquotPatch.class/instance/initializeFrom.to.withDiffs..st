initialize-release
initializeFrom: baseObjectContainer to: patchedObjectContainer withDiffs: diffDictionary
	base := baseObjectContainer.
	patched := patchedObjectContainer.
	diffs addAll: diffDictionary.