tests
testCreateDirectoryNoParent
	| path |
	path := FSPath * 'griffle' / 'nurp'.
	self 
		should: [filesystem createDirectory: path]
		raise: FSDirectoryDoesNotExist.
	
	
