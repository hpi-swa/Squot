adding and removing
initializeEdgesFromTotalOrdering: aSequenceableCollection
	"Treat each successor relation in the collection of nodes as an edge."
	aSequenceableCollection withIndexDo:
		[:each :i |
		"add successors"
		aSequenceableCollection from: i + 1 to: aSequenceableCollection size do:
			[:successor | (edges at: (index at: each)) add: successor -> 1]].