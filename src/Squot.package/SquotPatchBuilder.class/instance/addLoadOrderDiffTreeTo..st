*Squot-Tools
addLoadOrderDiffTreeTo: aCollection
	(originalLoadOrder hasEqualElements: patchedLoadOrder) ifTrue: [^ self].
	aCollection add:
		(SquotDiffNode
			title: 'Changed load order'
			content: self loadOrderMerge
			children: #()
			onInclude:
				[self loadOrderMerge newLoadOrder: patchedLoadOrder.
				diffs do: [:each | loadOrderMerge applyDiff: each]]
			onExclude:
				[self loadOrderMerge newLoadOrder: originalLoadOrder.
				diffs do: [:each | loadOrderMerge applyDiff: each]]).