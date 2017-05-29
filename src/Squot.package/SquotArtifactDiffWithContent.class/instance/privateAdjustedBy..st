copying
privateAdjustedBy: aDiffNode
	diffContent := diffContent squotAdjustToResemble: aDiffNode.
	topNodes := aDiffNode children.
	aDiffNode areAllChildrenActive ifFalse: [right := right copyWithDiffApplied: self].