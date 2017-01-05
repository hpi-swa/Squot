accessing
baseSnapshot
	^ base ifNil: [FSFilesystem memory root]