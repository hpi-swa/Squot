tests
testCreateDirectoryNoParent
	| path |
	path := FSPath root / 'griffle' / 'glob'.
	self 
		should: [ filesystem createDirectory: path ]
		raise: DirectoryDoesNotExist