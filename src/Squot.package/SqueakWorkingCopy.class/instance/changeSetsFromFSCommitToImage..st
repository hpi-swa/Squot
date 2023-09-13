changes-creation
changeSetsFromFSCommitToImage: anFSCommit
	^ self
		changeSetsFromMappers: (self readMappersFileFromFSCommit: anFSCommit)
		toMappers: self mappers
		old: [:old :empty | old changeSetFromFSCommit: anFSCommit toFSCommit: empty]
		common: [:common | common changeSetFromFSCommit: anFSCommit toImage: self]
		new: [:new :empty | new changeSetFromFSCommit: empty toImage: self]