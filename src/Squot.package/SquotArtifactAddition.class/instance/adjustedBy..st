copying
adjustedBy: aDiffNode 
	"Can only exclude or include addition wholly."
	aDiffNode isActive ifFalse: [^ SquotDiffOfEqualObjects instance].
	^ self