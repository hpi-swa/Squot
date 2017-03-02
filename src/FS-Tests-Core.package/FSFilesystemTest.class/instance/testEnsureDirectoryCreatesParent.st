tests
testEnsureDirectoryCreatesParent
	| path |
	path := Path * 'plonk' / 'griffle'.
	self delete: path.
	self delete: path parent.
	self 
		shouldnt: [filesystem ensureDirectory: path]
		raise: FSFilesystemError.
	self assert: (filesystem isDirectory: (Path * 'plonk')).
	self assert: (filesystem isDirectory: path).
	