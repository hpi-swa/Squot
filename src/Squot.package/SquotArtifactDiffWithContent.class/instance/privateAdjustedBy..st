copying
privateAdjustedBy: aDiffNode
	aDiffNode areAllChildrenActive ifFalse: [right := nil].
	diffContent := diffContent squotAdjustToResemble: aDiffNode.
	topNodes := aDiffNode children.