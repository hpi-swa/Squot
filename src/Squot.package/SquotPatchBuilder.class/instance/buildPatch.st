accessing
buildPatch
	base ifNil: [base := SquotSnapshot empty].
	self loadOrderMerge resetAppliedDiffs.
	diffs do: [:each | self loadOrderMerge applyDiff: each. "Applies removals and additions"].
	self loadOrderMerge
		detectConflicts;
		chooseIncoming.
	^ SquotPatch new
		initializeFrom: base to: patched withDiffs: (diffs select: [:each | each mayAffectArtifact]);
		loadOrderDiff: (self loadOrderMerge resolvedPatch ifNil: [self error: 'Load order conflicts not resolved']);
		yourself