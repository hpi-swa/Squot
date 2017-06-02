copying
squotAdjustToResemble: aSquotDiffNode
	^ aSquotDiffNode isActive
		ifTrue: [self]
		ifFalse: [SquotDiffOfEqualObjects instance]