delegate
entryFromNode: treeEntry path: path for: aFilesystem
	(treeEntry isKindOf: GitTreeEntry)
		ifFalse: [^ cacheStore entryFromNode: treeEntry path: path for: aFilesystem].
	^ GitFSDirectoryEntry
		unitOfWork: self unitOfWork
		treeEntry: treeEntry
		filesystem: aFilesystem
		path: path / treeEntry entryName
		creation: 0
		modification: 0
		isDir: treeEntry isInDirectoryMode