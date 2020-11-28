*Squot-Tools-Diffs
squotDiffNodeForClass: aSymbol operations: aCollection
	| node |
	"Similar method: SquotPackageMerge>>squotDiffNodeForClass: aSymbol operations: aCollection"
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
						sort: [:a :b | a title asString <= b title asString])
		onInclude: []
		onExclude: [].
	node content diffTreeNode: node.
	^ node