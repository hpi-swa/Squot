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
		size: (treeEntry hasSize
				ifTrue: [repository sizeOfObjectNamed: treeEntry entryHash]
				ifFalse: [0])