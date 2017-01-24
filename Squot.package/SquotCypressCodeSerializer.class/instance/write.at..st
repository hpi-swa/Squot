Squot serialization
write: anObject at: aPath
	self initialize.
	currentDirectory := snapshotBuilder at: aPath.
	currentDirectory ensureDirectory.
	fileTreeWriter directory: currentDirectory pathString.
	fileTreeWriter fileUtils directory: currentDirectory. self flag: #hack.
	fileTreeWriter initializePackageFileDirectoryCache.
	anObject squotWriteWith: self at: aPath. "double dispatch"
	cypressWriter writeDefinitions: definitions.