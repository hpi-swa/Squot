SquotPatch
loadOrderMerge
	^ loadOrderMerge ifNil: [self computeLoadOrderDiff. loadOrderMerge]