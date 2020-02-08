private
enqueueParentsOf: aMarkedVersion
	self flag: #duplication. "with VersionsMergeBaseMarker"
	aMarkedVersion object parents do: [:each |
		| markedParent |
		markedParent := self marked: each.
		(aMarkedVersion allMarks difference: markedParent allMarks)
			ifNotEmpty: [:additionalMarks |
				markedParent markWithAll: additionalMarks.
				searchFrontier add: markedParent]].