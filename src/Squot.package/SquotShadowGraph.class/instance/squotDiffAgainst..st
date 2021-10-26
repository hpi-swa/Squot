Squot-shadow-diffing
squotDiffAgainst: aGraph
	"Answer an object that describes the differences between me and otherContent."
	| diffBuilder |
	diffBuilder := SquotDiffBuilder new.
	diffBuilder left: self; right: aGraph.
	^ diffBuilder startFromLeft: self startShadow right: aGraph startShadow