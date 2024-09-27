changes-creation
changeSetsFromFSCommit: anFSCommit toImage: aWorkingCopy
	^ self
		changeSetsFromMetadata: (self loadMetadataFromFSCommit: anFSCommit in: aWorkingCopy)
		toMetadata: (self loadMetadataFromWorkingCopy: aWorkingCopy)
		old: [:old :empty | old changeSetFromFSCommit: anFSCommit toFSCommit: empty]
		common: [:common | common changeSetFromFSCommit: anFSCommit toImage: aWorkingCopy]
		new: [:new :empty | new changeSetFromFSCommit: empty toImage: aWorkingCopy]
		in: aWorkingCopy