private
diffNodeForClassNamed: aSymbol operationsAndConflicts: aCollection modifying: aSquotPackageMergeOrDiff classOperationOrConflict: aPatchOperationOrConflictOrNil
	| node |
	node := SquotDiffNode
		title: aSymbol, (self classSuffix: aPatchOperationOrConflictOrNil)
		content: (SquotPackageDiffClassChanges new className: aSymbol)
		children: ((aCollection
						collect: [:each | self nodeFor: each from: aSquotPackageMergeOrDiff])
						sort: [:a :b | a title asString <= b title asString])
		onInclude: []
		onExclude: [].
	node content diffTreeNode: node.
	^ node