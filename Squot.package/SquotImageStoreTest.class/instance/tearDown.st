running
tearDown
	imageStore := nil.
	createdClasses do: [:each | each removeFromSystemUnlogged].
	testEnvironment destroy.