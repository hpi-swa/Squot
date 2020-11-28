*Squot-Tools
squotDiffNodeForClass: aSymbol operations: aCollection
	| node |
	"Similar method: MCPatch>>squotDiffNodeForClass: aSymbol operations: aCollection"
	node := SquotDiffNode
		title: aSymbol, (self squotDiffNodeClassSuffix: aCollection)
		content: (SquotPackageDiffClassChanges new className: aSymbol)
		children: ((aCollection
						collect: [:each |
							each isConflict
								ifTrue: [SquotMergeDiffNode
											title: each operation squotDiffNodeSummary
											content: each
											children: #()
											onInclude: [each chooseRemote]
											onExclude: [each chooseLocal]
											onReset: [each clearChoice]]
								ifFalse: [SquotDiffNode
											title: each squotDiffNodeSummary
											content: each
											children: #()
											onInclude: [containerModifications at: (self keyOf: each definition) put: each]
											onExclude: [containerModifications removeKey: (self keyOf: each definition)]]])
						sort: [:a :b | a title asString <= b title asString])
		onInclude: []
		onExclude: [].
	node content diffTreeNode: node.
	^ node