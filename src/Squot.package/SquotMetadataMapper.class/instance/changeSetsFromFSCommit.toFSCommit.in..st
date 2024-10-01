changes-creation
changeSetsFromFSCommit: anFSCommit toFSCommit: anotherFSCommit in: aWorkingCopy
	^ self
		changeSetsFromMetadata: (self loadMetadataWithUntrackedMappersFromFSCommit: anFSCommit in: aWorkingCopy)
		toMetadata: (self loadMetadataWithUntrackedMappersFromFSCommit: anotherFSCommit in: aWorkingCopy)
		old: [:old :empty | old changeSetFromFSCommit: anFSCommit toFSCommit: empty]
		common: [:common | common changeSetFromFSCommit: anFSCommit toFSCommit: anotherFSCommit]
		new: [:new :empty | new changeSetFromFSCommit: empty toFSCommit: anotherFSCommit]
		in: aWorkingCopy