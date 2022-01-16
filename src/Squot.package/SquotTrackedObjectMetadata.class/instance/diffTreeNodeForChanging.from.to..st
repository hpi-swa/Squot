*Squot-Tools private
diffTreeNodeForChanging: key from: leftValue to: value
	^ SquotDiffNode
		title: 'Set ', key, ' to ', value printString
		content: nil
		children: #()
		onInclude: [self at: key put: value]
		onExclude: 	[self at: key put: leftValue]