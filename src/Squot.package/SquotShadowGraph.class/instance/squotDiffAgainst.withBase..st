Squot-shadow-diffing
squotDiffAgainst: incomingGraph withBase: baseGraph
	"Answer an object that describes the merge between me and otherContent based on baseContent."
	"New name suggestions:
	mergeWith: incomingGraph basedOn: baseGraph (there are no different kinds of graphs)"
	^ SquotObjectGraphMerge
		into: self
		merge: incomingGraph
		basedOn: baseGraph