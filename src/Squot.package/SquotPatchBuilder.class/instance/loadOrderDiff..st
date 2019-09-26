initialize-release
loadOrderDiff: aDiffPatch
	loadOrderDiff := aDiffPatch.
	patchedLoadOrder := aDiffPatch applyTo: originalLoadOrder.