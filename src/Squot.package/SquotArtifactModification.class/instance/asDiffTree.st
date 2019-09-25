converting
asDiffTree
	^ SquotDiffNode
		title: self diffTreeNodeTitle
		content: self
		children: self topNodes
		onInclude: []
		onExclude: []