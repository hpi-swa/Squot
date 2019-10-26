converting
asDiffTree
	^ SquotMergeDiffNode
		title: self diffTreeNodeTitle
		content: self
		children: self diffTreeChildren
		onInclude: [self chooseIncoming]
		onExclude: [self chooseWorking]
		onReset: [self resetChoice]