instance creation
unitOfWork: aGitUnitOfWork treeEntry: aGitTreeEntry filesystem: aFilesystem path: aPath creation: cTime modification: mTime isDir: aBoolean
	| entry |
	entry := self
		filesystem: aFilesystem
		path: aPath
		creation: cTime
		modification: mTime
		isDir: aBoolean
		size: self sizeNotComputedYet.
	entry setUnitOfWork: aGitUnitOfWork treeEntry: aGitTreeEntry.
	^ entry