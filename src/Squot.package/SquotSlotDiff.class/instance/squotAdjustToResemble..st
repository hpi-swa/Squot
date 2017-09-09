manipulation
squotAdjustToResemble: aDiffNode
	"By default, all or nothing."
	aDiffNode isActive ifFalse: [^ SquotDiffOfEqualObjects instance].
	^ self