changes-operations
serialize: aSnapshot into: aFileSystem
	| directory |
	directory := self packageDirectoryIn: aFileSystem.
	aSnapshot definitions
		ifEmpty: [directory deleteAll]
		ifNotEmpty: [
			self cleanDirectory: directory.
			self write: aSnapshot with: (self writerOn: directory)].