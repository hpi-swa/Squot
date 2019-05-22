*Squot-diff-converting
squotDiffNodeForClass: aSymbol operations: aCollection
	^ SquotDiffNode
		title: aSymbol, (self squotDiffNodeClassSuffix: aCollection)
		content: nil
		children: ((aCollection
						collect: [:each | SquotDiffNode
							title: each squotDiffNodeSummary
							content: each
							children: #()
							onInclude: [operations add: each]
							onExclude: [operations remove: each]])
						sort: [:a :b | a title <= b title])
		onInclude: []
		onExclude: []