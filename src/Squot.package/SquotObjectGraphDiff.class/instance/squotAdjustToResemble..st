Squot-diff-manipulation
squotAdjustToResemble: aDiffNode
	| adjustedDiff |
	adjustedDiff := self copy.
	self startDiff
		squotAdjustToResemble: aDiffNode
		updating: adjustedDiff.
	^ adjustedDiff
		