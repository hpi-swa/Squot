as yet unclassified
asDiffNode

 ^ SquotMergeDiffNode
		title: self title
		content: self
		children: #()
		onInclude: [self chooseRight] 
		onExclude: [self chooseLeft]
		onReset: [self resetChoice]