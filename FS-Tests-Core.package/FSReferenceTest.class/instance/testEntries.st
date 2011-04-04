tests
testEntries

	| ref entries |
	filesystem createDirectory: '/alpha'.
	filesystem createDirectory: '/alpha/beta'.
	filesystem createDirectory: '/alpha/gamma'.
	
	ref := filesystem referenceTo: '/alpha'.
	entries := ref entries.
	self assert: entries size = 2.
	entries do:
		[:entry |
		self assert: entry class = FSDirectoryEntry.
		self assert: (entry reference isChildOf: ref).
		self assert: (#('beta' 'gamma') includes: entry reference basename)]