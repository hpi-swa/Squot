converting
topNodes
	right isLoadable ifFalse: [^ #()].
	^ {SquotDiffNode title: 'Add ', right path content: self children: #()}