accessing
wrapEntry: realEntry
	^ FSDirectoryEntry
		filesystem: self
		path: realEntry reference path
		creation: realEntry creation
		modification: realEntry modification
		isDir: realEntry isDirectory
		size: realEntry size