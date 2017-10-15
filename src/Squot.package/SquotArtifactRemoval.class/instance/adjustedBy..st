copying
adjustedBy: aDiffNode 
	"Can only exclude or include removal wholly."
	aDiffNode isActive ifFalse: [^ SquotDiffOfEqualObjects instance].
	^ self