changes-operations
writerOn: aReference
	| repository fileUtils fileTreeWriter |
	repository := SquotMockMCRepository new
					directory: aReference;
					yourself.
	fileUtils := self fileUtilsOn: aReference.
	fileTreeWriter := (self fileTreeWriterClass on: repository)
						directory: (SquotPathUtilities asString: aReference path);
						fileUtils: fileUtils;
						initializePackageFileDirectoryCache;
						yourself.
	^ (self writerClass on: fileTreeWriter)
		fileUtils: fileUtils;
		yourself