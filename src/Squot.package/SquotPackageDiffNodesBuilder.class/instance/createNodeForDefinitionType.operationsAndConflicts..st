node creation
createNodeForDefinitionType: aString operationsAndConflicts: aCollection
	^ SquotDiffNode
		title: aString
		content: nil
		children: (aCollection collect: [:each | self nodeFor: each])
		onInclude: []
		onExclude: []