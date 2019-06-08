public
buildPatch
	self updatePatchedArtifacts.
	^ SquotPatch new
		initializeFrom: existingContainer
		to: patchedContainer
		withDiffs: (diffs reject: [:each | each hasChanges not]);
		loadOrderDiff: loadOrderPatch;
		yourself