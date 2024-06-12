changes-creation
changeSetsFromImage: aWorkingCopy toFSCommit: anFSCommit
	^ self
		changeSetsFromMetadata: (self loadMetadataFromWorkingCopy: aWorkingCopy)
		toMetadata: (self loadMetadataFromFSCommit: anFSCommit in: aWorkingCopy)
		old: [:old :empty | old changeSetFromImage: aWorkingCopy toFSCommit: empty]
		common: [:common | common changeSetFromImage: aWorkingCopy toFSCommit: anFSCommit]
		new: [:new :empty | new changeSetFromFSCommit: empty toFSCommit: anFSCommit]
		in: aWorkingCopy