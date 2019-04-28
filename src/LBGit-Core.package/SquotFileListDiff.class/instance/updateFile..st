applying
updateFile: aPath

	self 
		deleteFile: aPath;
		createFile: aPath.
	