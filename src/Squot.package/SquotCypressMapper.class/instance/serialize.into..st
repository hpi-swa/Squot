changes-operations
serialize: aSnapshot into: aFileSystem
	| writer |
	writer := self writerIn: aFileSystem.
	aSnapshot definitions
		ifEmpty: [writer stream packageFileDirectory deleteAll]
		ifNotEmpty: [:definitions | writer writeDefinitions: definitions].