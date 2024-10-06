instance creation
scanForMCRepositoryDirectory: aString ifAbsent: aBlock
	MCRepositoryGroup default repositories do: [:each |
		(each squotDirectoryForProjectNamed: aString)
			ifNotNil: [:directory | ^ directory]].
	^ aBlock value