*Squot-Tools-Diffs
squotDiffNodeForClass: aSymbol operations: aCollection
	| node |
	node := SquotDiffNode
		title: aSymbol, (self squotDiffNodeClassSuffix: aCollection)
		content: (SquotPackageDiffClassChanges new className: aSymbol)
		children: ((aCollection
						collect: [:each | SquotDiffNode
							title: each squotDiffNodeSummary
							content: each
							children: #()
							onInclude: [operations add: each]
							onExclude: [operations remove: each]])
						sort: [:a :b | a title <= b title])
		onInclude: []
		onExclude: [].
	node content diffTreeNode: node.
	^ node