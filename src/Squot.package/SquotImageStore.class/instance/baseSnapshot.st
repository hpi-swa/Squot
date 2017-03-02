accessing
baseSnapshot
	self flag: #metamodel.
	^ base ifNil: [SquotSnapshot on: FileSystem memory root]