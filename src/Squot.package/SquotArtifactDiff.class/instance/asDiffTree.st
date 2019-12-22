converting
asDiffTree
	| node |
	node := SquotDiffNode
		title: self diffTreeNodeTitle
		content: self
		children: self topNodes
		onInclude: []
		onExclude: [].
	node withAllChildren do: [:each | each artifactDiff: self].
	^ node