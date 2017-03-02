tests
testEnsureDirectory
	| path |
	path := FSPath * 'plonk'.
	self delete: path.
	filesystem ensureDirectory: path.
	self assert: (filesystem isDirectory: path).