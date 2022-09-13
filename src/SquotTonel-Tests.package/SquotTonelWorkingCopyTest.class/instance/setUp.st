running
setUp
	repository := SquotFileTestRepository new initializeInDirectory: FileSystem memory root.
	workingCopy :=
		repository createWorkingCopy
			store: SquotImageStore new;
			yourself.