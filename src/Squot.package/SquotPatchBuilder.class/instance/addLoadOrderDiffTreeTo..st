*Squot-Tools
addLoadOrderDiffTreeTo: aCollection
	(originalLoadOrder hasEqualElements: patchedLoadOrder) ifTrue: [^ self].
	aCollection add:
		(loadOrderMerge
			createDiffOrMergeTreeNodeWithWorkingOrder: [originalLoadOrder]
			incomingOrder: [patchedLoadOrder]).