copying
privateAdjustedBy: aDiffNode
	right := left copyWithDiffApplied: aDiffNode.
	diffContent := diffContent squotAdjustToResemble: aDiffNode.
	topNodes := aDiffNode children.