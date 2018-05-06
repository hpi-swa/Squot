copying
adjustedBy: aDiffNode 
	"Can only exclude or include addition wholly."
	aDiffNode children first isActive ifFalse: [^ SquotDiffOfEqualObjects instance].
	^ self