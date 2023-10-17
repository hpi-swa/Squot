changes-operations
serialize: aSnapshot into: aFileSystem
	| writer |
	writer := (self writerOn: aFileSystem).
	aSnapshot definitions
		ifEmpty: [writer packageDir deleteAll]
		ifNotEmpty: [writer writeSnapshot: aSnapshot].