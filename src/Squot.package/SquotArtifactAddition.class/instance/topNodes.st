converting
topNodes
	right isLoadable ifFalse: [^ #()].
	self flag: #stub.
	^ {SquotDiffNode title: 'add ', right path content: self children: #()}