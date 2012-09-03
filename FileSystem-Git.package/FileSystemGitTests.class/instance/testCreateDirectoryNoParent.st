tests
testCreateDirectoryNoParent
	| path |
	path := Path root / 'griffle' / 'glob'.
	self 
		should: [ filesystem createDirectory: path ]
		raise: DirectoryDoesNotExist