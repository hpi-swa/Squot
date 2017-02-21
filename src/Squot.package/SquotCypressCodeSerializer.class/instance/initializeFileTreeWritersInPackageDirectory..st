private
initializeFileTreeWritersInPackageDirectory: aDirectoryReference
	currentDirectory := aDirectoryReference.
	currentDirectory ensureDirectory.
	fileTreeWriter directory: currentDirectory pathString.
	fileTreeWriter fileUtils directory: currentDirectory. self flag: #hack.
	fileTreeWriter initializePackageFileDirectoryCache.