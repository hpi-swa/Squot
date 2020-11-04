*Squot-Tools
addLoadOrderDiffTreeTo: aCollection
	(originalLoadOrder hasEqualElements: patchedLoadOrder) ifTrue: [^ self].
	aCollection add:
		(SquotDiffNode
			title: 'Changed load order'
			content: self loadOrderMerge
			children: #()
			onInclude: [loadOrderMerge := self mergeNewLoadOrder: patchedLoadOrder]
			onExclude: [loadOrderMerge := self mergeNewLoadOrder: originalLoadOrder]).