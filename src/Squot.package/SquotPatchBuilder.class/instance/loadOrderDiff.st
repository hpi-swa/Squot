SquotPatch
loadOrderDiff
	^ loadOrderDiff ifNil: [self computeLoadOrderDiff]