public
buildPatch
	^ SquotPatch new
		initializeWith: diffs;
		loadOrderDiff: loadOrderPatch;
		yourself