running
tearDown
	fileStore := nil.
	imageStore := nil.
	createdClasses do: [:each | each removeFromSystemUnlogged].