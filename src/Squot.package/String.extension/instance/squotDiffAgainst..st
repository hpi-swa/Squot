*Squot-content-diff
squotDiffAgainst: otherValue
	^  HuntMcilroyDiff new file1: self; file2: (otherValue ifNil: [String empty]); yourself