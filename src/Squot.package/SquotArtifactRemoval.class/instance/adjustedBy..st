copying
adjustedBy: aDiffNode 
	"Can only exclude or include removal wholly."
	aDiffNode children first isActive ifFalse: [^ SquotDiffOfEqualObjects instance].
	^ self