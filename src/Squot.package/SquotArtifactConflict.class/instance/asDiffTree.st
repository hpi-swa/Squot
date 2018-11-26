converting
asDiffTree
	^ SquotMergeDiffNode
		title: right squotConflictText
		content: self
		children: #()
		onInclude: []
		onExclude: []
		onReset: []