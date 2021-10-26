Squot-shadow-diffing
squotDiffAgainst: otherShadow
	^ GenericDiff squotDiffClass new
		file1: value;
		file2: (otherShadow value ifNil: [value class new: 0]);
		yourself 