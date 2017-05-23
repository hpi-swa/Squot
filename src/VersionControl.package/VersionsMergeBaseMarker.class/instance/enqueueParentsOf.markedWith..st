private
enqueueParentsOf: aMarkedVersion markedWith: aCollectionOfMarks
	aMarkedVersion object parents do: [:each |
		| markedParent |
		markedParent := self marked: each.
		(aMarkedVersion allMarks, aCollectionOfMarks difference: markedParent allMarks)
			ifNotEmpty: [:additionalMarks |
				markedParent markWithAll: additionalMarks.
				versionsQueue add: markedParent]].