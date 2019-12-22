converting
asDiffTree
	| node |
	node := SquotMergeDiffNode
		title: self diffTreeNodeTitle
		content: self
		children: self diffTreeChildren
		onInclude: [self chooseIncoming]
		onExclude: [self chooseWorking]
		onReset: [self resetChoice].
	node withAllChildren do: [:each | each artifactDiff: self].
	^ node