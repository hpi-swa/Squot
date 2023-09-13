changes-creation
changeSetsFromFSCommit: anFSCommit toFSCommit: anotherFSCommit
	^ self
		changeSetsFromMappers: (self readMappersFileFromFSCommit: anFSCommit)
		toMappers: (self readMappersFileFromFSCommit: anotherFSCommit)
		old: [:old :empty | old changeSetFromFSCommit: anFSCommit toFSCommit: empty]
		common: [:common | common changeSetFromFSCommit: anFSCommit toFSCommit: anotherFSCommit]
		new: [:new :empty | new changeSetFromFSCommit: empty toFSCommit: anotherFSCommit]