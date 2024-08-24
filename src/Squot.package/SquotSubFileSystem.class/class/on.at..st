instance creation
on: aFileSystem at: aPath
	^ self new
		fileSystem: aFileSystem;
		rootPath: aPath;
		yourself