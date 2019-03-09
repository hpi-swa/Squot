public
buildPatch
	^ SquotPatch new
		initializeWith: (diffs reject: [:each | each hasChanges not]);
		loadOrderDiff: self computeLoadOrderDiff;
		yourself