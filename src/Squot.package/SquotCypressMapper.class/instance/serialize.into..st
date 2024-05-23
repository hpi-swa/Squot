changes-operations
serialize: aSnapshot into: aFileSystem
	| writer directory |
	writer := self writerIn: aFileSystem.
	directory := writer stream packageFileDirectory.
	directory deleteAll.
	aSnapshot definitions ifEmpty: [^ self].
	directory ensureDirectory.
	writer writeDefinitions: aSnapshot definitions.