delegate
createDirectory: aPath
	self ensure: aPath.
	cache createDirectory: aPath.
	modManager markDirectoryCreated: aPath.