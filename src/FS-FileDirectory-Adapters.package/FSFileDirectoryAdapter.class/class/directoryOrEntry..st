instance creation
directoryOrEntry: aFSReference
	^ aFSReference isDirectory
		ifTrue: [self on: aFSReference]
		ifFalse: [FSFileDirectoryEntryAdapter on: aFSReference]