running
setUp
	repository := SquitRepository onDirectory: FileSystem memory root.
	operation := SquitInteractiveAddRemote repository: repository.