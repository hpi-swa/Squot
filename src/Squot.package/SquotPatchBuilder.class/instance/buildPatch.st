public
buildPatch
	| patch |
	patch := SquotPatch with: diffs.
	patch loadOrderDiff: self computeLoadOrderDiff.
	^ patch