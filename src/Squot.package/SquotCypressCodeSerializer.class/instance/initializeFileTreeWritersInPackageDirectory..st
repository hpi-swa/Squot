private
initializeFileTreeWritersInPackageDirectory: aDirectoryReference
	currentDirectory := aDirectoryReference.
	currentDirectory ensureDirectory.
	fileTreeWriter directory: currentDirectory pathString.
	fileUtils directory: currentDirectory.
	fileTreeWriter initializePackageFileDirectoryCache.