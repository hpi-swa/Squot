adding and removing
decreaseEdgesFromTotalOrdering: aSequenceableCollection
	"Treat each successor relation in the collection of nodes as an edge, but decrease that edge in the graph."
	aSequenceableCollection withIndexDo:
		[:each :i |
		"decrease successors"
		aSequenceableCollection from: i + 1 to: aSequenceableCollection size do:
			[:successor | | assoc |
			assoc := (edges at: (index at: each)) detect: [:edge | edge key = successor] ifNone: [].
			assoc ifNotNil:
				[assoc value = 1
					ifTrue: [(edges at: (index at: each)) remove: assoc]
					ifFalse: [assoc value: assoc value - 1]]]].