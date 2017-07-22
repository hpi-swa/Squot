Squot-diff-manipulation
squotAdjustToResemble: aSquotDiffNode
	^ self copyWithPatch: (patch squotAdjustToResemble: aSquotDiffNode)