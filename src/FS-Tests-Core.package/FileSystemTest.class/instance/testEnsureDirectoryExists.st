tests
testEnsureDirectoryExists
	| path |
	path := FSPath * 'plonk'.
	self delete: path.
	filesystem createDirectory: path.
	self 
		shouldnt: [filesystem ensureDirectory: path]
		raise: FSFilesystemError.
	