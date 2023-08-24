operations
processBlobAt: path in: tree
	| reference data blob entry |
	reference := cache referenceTo: path.
	
	reference isFile ifFalse: [ ^ self].
	
	data := reference readStreamDo: [:stream | self filterBytesFrom: stream at: path].
	blob := GitBlob bytes: data in: repository.
	
	entry := GitOwningTreeEntry
		file: blob
		named: path basename
		in: repository.
		
	(self copiedTreeForModification: tree at: path parent) putEntry: entry.
	pendingPathsForEntryUpdate add: path parent. "need to update the ancestor trees later"