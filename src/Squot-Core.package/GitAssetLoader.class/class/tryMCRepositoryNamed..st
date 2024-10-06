instance creation
tryMCRepositoryNamed: aString
	| directory workingCopy fileSystem |
	directory := self scanForMCRepositoryDirectory: aString ifAbsent: [^ nil].
	workingCopy := SquotBaseWorkingCopy newWithName: aString.
	fileSystem := SquotSubFileSystem onReference: directory.
	workingCopy mappers:
		(workingCopy metadataMapper loadMappersFromFileSystem: fileSystem).
	(workingCopy mappersOfKind: SquotAssetMapper) do: [:each |
		each materialize: (each loadAssetFileFrom: fileSystem) in: workingCopy].
	^ self onWorkingCopy: workingCopy