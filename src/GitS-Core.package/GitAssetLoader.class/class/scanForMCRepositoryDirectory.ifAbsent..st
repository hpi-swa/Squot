instance creation
scanForMCRepositoryDirectory: aString ifAbsent: aBlock
	MCRepositoryGroup default repositories do: [:each |
		(each gitSDirectoryForProjectNamed: aString)
			ifNotNil: [:directory | ^ directory]].
	^ aBlock value