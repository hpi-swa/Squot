private
entryFromNode: anArray filesystem: aFilesystem path: aPath
	^ FSDirectoryEntry
		filesystem: aFilesystem
		path: aPath
		creation: (anArray at: 2)
		modification: (anArray at: 3)
		isDir: (anArray at: 4)
		size: (anArray at: 5)