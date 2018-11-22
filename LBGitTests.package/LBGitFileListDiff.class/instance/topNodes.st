as yet unclassified
topNodes

	^ (self added collect: [:each | SquotDiffNode
		title: 'xAdded: ', each
		content: self
		children: #()])
	union: 
	(self removed collect: [:each | SquotDiffNode
		title: 'xRemoved: ', each
		content: self
		children: #()])