tests
testFile
	| path out |
	path := FSPath * 'gooly'.
	out := filesystem open: path writable: true.
	out close.
	self assert: (filesystem exists: path).
	self deny: (filesystem isDirectory: path).
	self assert: (filesystem isFile: path).
	filesystem delete: path.
	self deny: (filesystem exists: path)