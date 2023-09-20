changes-creation
changeSetsFromFSCommit: anFSCommit toFSCommit: anotherFSCommit in: aWorkingCopy
	^ self
		changeSetsFromMappers: (self loadMappersFromFSCommit: anFSCommit)
		toMappers: (self loadMappersFromFSCommit: anotherFSCommit)
		old: [:old :empty | old changeSetFromFSCommit: anFSCommit toFSCommit: empty]
		common: [:common | common changeSetFromFSCommit: anFSCommit toFSCommit: anotherFSCommit]
		new: [:new :empty | new changeSetFromFSCommit: empty toFSCommit: anotherFSCommit]
		in: aWorkingCopy