Squot-shadow-diffing
squotDiffAgainst: otherShadow with: aDiffBuilder
	"Answer an object that describes the differences between me and otherContent."
	^ aDiffBuilder diffFrom: self to: otherShadow
		ifNew: [LBGitDiff new left: self; right: otherShadow.]
		andInitialize: [:diff | "Do nothing for now diff diff: self against: otherShadow with: aDiffBuilder"]