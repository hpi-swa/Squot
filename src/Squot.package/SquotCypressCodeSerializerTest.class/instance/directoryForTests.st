tests
directoryForTests
	| directory |
	directory := (FileSystem store: (SquotFSStoreSpy on: FileSystem memory store "FileSystem disk store")) referenceTo: FSPath root "FSLocator image parent / 'test'".
	directory ensureDirectory.
	directory children do: [:each | each deleteAll].
	^ directory