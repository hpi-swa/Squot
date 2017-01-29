accessing
baseSnapshot
	self flag: #metamodel.
	^ base ifNil: [SquotSnapshot on: FSFilesystem memory root]