tests
testEnsureDirectoryCreatesParent
	| path |
	path := FSPath * 'plonk' / 'griffle'.
	self delete: path.
	self delete: path parent.
	self 
		shouldnt: [filesystem ensureDirectory: path]
		raise: FSFilesystemError.
	self assert: (filesystem isDirectory: (FSPath * 'plonk')).
	self assert: (filesystem isDirectory: path).
	