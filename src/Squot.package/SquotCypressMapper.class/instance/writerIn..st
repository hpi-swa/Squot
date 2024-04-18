changes-operations
writerIn: aFileSystem
	| directory repository fileUtils fileTreeWriter |
	directory := self packageDirectoryIn: aFileSystem.
	repository := SquotMockMCRepository new
					directory: directory;
					yourself.
	fileUtils := self fileUtilsOn: directory.
	fileTreeWriter := (self fileTreeWriterClass on: repository)
						directory: (SquotPathUtilities asString: directory path);
						fileUtils: fileUtils;
						initializePackageFileDirectoryCache;
						yourself.
	^ (self writerClass on: fileTreeWriter)
		fileUtils: fileUtils;
		yourself