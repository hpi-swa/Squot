as yet unclassified
asDiffTree

	^ SquotDiffNode 
		title: self path
		content: self 
		children: self topNodes
		onInclude: [] 
		onExclude: []