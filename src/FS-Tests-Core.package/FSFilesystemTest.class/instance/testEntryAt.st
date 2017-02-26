tests
testEntryAt
	| path entry |
	path := FSPath * 'plonk'.
	filesystem createDirectory: path.
	self delete: path.
	entry := filesystem entryAt: path.
	self assert: entry isDirectory.
	self assert: entry reference = (filesystem referenceTo: path) asAbsolute