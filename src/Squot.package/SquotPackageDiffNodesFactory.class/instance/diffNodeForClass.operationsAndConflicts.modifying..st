private
diffNodeForClass: aSymbol operationsAndConflicts: aCollection modifying: aSquotPackageMergeOrDiff
	| node |
	node := SquotDiffNode
		title: aSymbol, (self classSuffix: aCollection)
		content: (SquotPackageDiffClassChanges new className: aSymbol)
		children: ((aCollection
						collect: [:each | self nodeFor: each from: aSquotPackageMergeOrDiff])
						sort: [:a :b | a title asString <= b title asString])
		onInclude: []
		onExclude: [].
	node content diffTreeNode: node.
	^ node