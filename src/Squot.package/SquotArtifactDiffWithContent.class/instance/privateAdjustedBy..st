copying
privateAdjustedBy: aDiffNode
	aDiffNode isActive ifFalse: [^ SquotDiffOfEqualObjects instance].
	aDiffNode areAllChildrenActive ifFalse: [right := left copyWithDiffApplied: self].
	^ self