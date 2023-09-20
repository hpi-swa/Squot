changes-creation
changeSetsFromImage: aWorkingCopy toFSCommit: anFSCommit
	^ self
		changeSetsFromMappers: (self loadMappersFromWorkingCopy: aWorkingCopy)
		toMappers: (self loadMappersFromFSCommit: anFSCommit)
		old: [:old :empty | old changeSetFromImage: aWorkingCopy toFSCommit: empty]
		common: [:common | common changeSetFromImage: aWorkingCopy toFSCommit: anFSCommit]
		new: [:new :empty | new changeSetFromFSCommit: empty toFSCommit: anFSCommit]
		in: aWorkingCopy