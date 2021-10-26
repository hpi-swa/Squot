Squot-shadow-diffing
squotWith: aDiffBuilder diffFromSequence: leftSequence
	"Double dispatch from a sequence."
	self deprecated: 'Use squotDiffAgainst: instead, or better yet, use SquotBitsShadowMirror newDiffFrom:to:'.
	^ GenericDiff squotDiffClass new
		file1: leftSequence;
		file2: value;
		yourself