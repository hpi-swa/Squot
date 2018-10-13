public
buildPatch
	^ SquotPatch new
		initializeWith: diffs;
		loadOrderDiff: self computeLoadOrderDiff;
		yourself