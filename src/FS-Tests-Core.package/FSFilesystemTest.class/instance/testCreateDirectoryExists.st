tests
testCreateDirectoryExists
	| path |
	path := FSPath * 'griffle'.
	self delete: path.
	filesystem createDirectory: path.
	self 
		should: [filesystem createDirectory: path]
		raise: FSDirectoryExists.
		

	
	
