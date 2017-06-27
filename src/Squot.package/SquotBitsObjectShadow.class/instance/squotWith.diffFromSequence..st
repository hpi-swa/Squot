Squot-shadow-diffing
squotWith: aDiffBuilder diffFromSequence: leftSequence
	"Double dispatch from a sequence."
	^ GenericDiff squotDiffClass new
		file1: leftSequence;
		file2: value;
		yourself