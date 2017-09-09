converting
topNodes
	left isLoadable ifFalse: [^ #()].
	self flag: #stub.
	^ {SquotDiffNode title: 'remove ', right path content: self children: #()}