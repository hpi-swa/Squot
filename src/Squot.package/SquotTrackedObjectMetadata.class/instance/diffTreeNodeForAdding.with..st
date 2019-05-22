private comparing
diffTreeNodeForAdding: key with: value
	^ SquotDiffNode
		title: 'Set ', key, ' to ', value printString
		content: nil
		children: #()
		onInclude: [self at: key put: value]
		onExclude: [self removeKey: key]