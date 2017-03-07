delegate
entryFromNode: treeEntry path: path for: aFilesystem
	treeEntry class == GitTreeEntry
		ifFalse: [^ cacheStore entryFromNode: treeEntry path: path for: aFilesystem].
	^ FSDirectoryEntry
		filesystem: aFilesystem
		path: path / treeEntry entryName
		creation: 0
		modification: 0
		isDir: treeEntry isInDirectorymode
		size: (treeEntry isInDirectorymode
				ifTrue: [0]
				ifFalse: [repository sizeOfObjectNamed: treeEntry entryHash])