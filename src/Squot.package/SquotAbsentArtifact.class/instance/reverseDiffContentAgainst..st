private comparing
reverseDiffContentAgainst: otherContent
	"Since I am absent, diff against null content"
	"Double dispatch with diffContentAgainstThatOf:"
	otherContent ifNil: [^ SquotDiffOfEqualObjects instance].
	^ otherContent squotDiffAgainst: otherContent squotAbsentContent