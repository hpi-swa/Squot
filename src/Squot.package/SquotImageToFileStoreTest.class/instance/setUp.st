running
setUp
	changeLogSuppressor := SUnitChangeLogSuppressor new.
	createdClasses := OrderedCollection new.
	imageStore := SquotImageStore new.
	fileStore := SquotFileSystemStore inDirectory: FileSystem memory root.