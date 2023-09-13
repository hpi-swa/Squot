changes-creation
changeSetsFromImageToFSCommit: anFSCommit
	^ self
		changeSetsFromMappers: self mappers
		toMappers: (self readMappersFileFromFSCommit: anFSCommit)
		old: [:old :empty | old changeSetFromImage: self toFSCommit: empty]
		common: [:common | common changeSetFromImage: self toFSCommit: anFSCommit]
		new: [:new :empty | new changeSetFromFSCommit: empty toFSCommit: anFSCommit]