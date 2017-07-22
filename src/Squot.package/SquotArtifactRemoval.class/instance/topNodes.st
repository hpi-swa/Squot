converting
topNodes
	left isLoadable ifFalse: [^ #()].
	^ {SquotDiffNode title: 'Remove ', left path content: self children: #()}