Squot-shadow-diffing
squotDiffAgainst: otherObjectGraph with: aDiffBuilder
	"Answer an object that describes the differences between me and otherContent."
	^ aDiffBuilder left: self startShadow right: otherObjectGraph startShadow