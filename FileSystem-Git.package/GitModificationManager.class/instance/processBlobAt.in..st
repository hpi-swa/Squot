operations
processBlobAt: path in: tree
	| reference data blob entry |
	reference := cache referenceTo: path.
	
	reference isFile ifFalse: [ ^ self].
	
	data := reference readStreamDo: [ :stream | stream contents ].
	blob := GitBlob bytes: data in: repository.
	blob store.
	
	entry := GitTreeEntry
		fileNamed: path basename
		hash: blob hash.
	tree putEntry: entry