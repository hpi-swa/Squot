accessing
buildPatch
	base ifNil: [base := SquotSnapshot empty].
	self updateRightArtifacts.
	^ SquotPatch new
		initializeFrom: base to: patched withDiffs: (diffs reject: [:each | each hasChanges not]);
		loadOrderDiff: (self loadOrderMerge resolvedPatch ifNil: [self error: 'Load order conflicts not resolved']);
		yourself