Squot-shadow-diffing
squotDiffAgainst: incomingGraph withBase: baseGraph
	"Answer an object that describes the merge between me and otherContent based on baseContent."
	self flag: #deprecated.
	^ self squotMergeWith: incomingGraph basedOn: baseGraph