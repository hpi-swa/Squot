accessing
delete: aString
	| refFile |
	refFile := baseDir resolve: aString.
	refFile isDirectory ifTrue: [self error: 'Incomplete reference: ', aString].
	refFile ensureDeleted.