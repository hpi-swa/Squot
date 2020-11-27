adding and removing
increaseEdgesFromTotalOrdering: aSequenceableCollection
	"Treat each successor relation in the collection of nodes as an edge."
	aSequenceableCollection withIndexDo:
		[:each :i |
		"add or increase successors"
		aSequenceableCollection from: i + 1 to: aSequenceableCollection size do:
			[:successor | | assoc |
			assoc := (edges at: (index at: each)) detect: [:edge | edge key = successor] ifNone: [(edges at: (index at: each)) add: successor -> 0].
			assoc value: assoc value + 1]].