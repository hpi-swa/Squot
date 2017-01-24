accessing
baseSnapshot
	^ base ifNil: [SquotSnapshot on: FSFilesystem memory root]