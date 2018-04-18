converting
topNodes
	left isLoadable ifFalse: [^ #()].
	self flag: #stub.
	^ {SquotDiffNode title: 'remove ', left path content: self children: #()}