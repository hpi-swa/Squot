private
diffNodeForClass: aSymbol operationsAndConflicts: aCollection modifying: aSquotPackageMergeOrDiff
	| node |
	node := SquotDiffNode
		title: aSymbol, (self classSuffix: aCollection)
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
											onInclude: [aSquotPackageMergeOrDiff addOperationOrConflict: each]
											onExclude: [aSquotPackageMergeOrDiff removeOperationOrConflict: each]]])
						sort: [:a :b | a title asString <= b title asString])
		onInclude: []
		onExclude: [].
	node content diffTreeNode: node.
	^ node