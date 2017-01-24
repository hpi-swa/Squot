running
tearDown
	createdClasses do: [:each | each removeFromSystemUnlogged].
	createdEnvironments do: [:each | each destroy].