changes-operations
readerIn: aFileSystem
	| directory |
	directory := self packageDirectoryIn: aFileSystem.
	^ (self readerClass on: directory)
		fileUtils: (self fileUtilsOn: directory);
		packageDirectory: directory pathString;
		yourself