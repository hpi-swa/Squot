Squot-shadow-diffing
squotDiffAgainst: otherGraph withBase: baseGraph with: aDiffBuilder
	"Answer an object that describes the merge between me and otherGraph based on baseGraph."
	^ aDiffBuilder left: self startShadow right: otherGraph startShadow base: baseGraph startShadow