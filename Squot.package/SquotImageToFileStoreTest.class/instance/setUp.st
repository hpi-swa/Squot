initialize-release
setUp
	createdClasses := OrderedCollection new.
	imageStore := SquotImageStore new.
	fileStore := SquotFileSystemStore inDirectory: FSFilesystem memory root.