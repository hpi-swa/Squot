operations
processCreationOf: entries from: entryPath
	|tree childTree addedEntryPathToPending|
	addedEntryPathToPending := false.
	entries
		select: [ :path | (cache referenceTo: path) isDirectory ]
		thenDo: [ :directory |
			childTree := (self treeAt: directory).
			"don't process empty trees for now"
			childTree isEmpty ifFalse: [
				tree := (self copiedTreeForModificationAt: entryPath)
					putEntry: (GitOwningTreeEntry
						directory: childTree
						named: directory basename
						in: repository);
					yourself.
				addedEntryPathToPending
					ifFalse: [pendingPathsForEntryUpdate add: entryPath.
						addedEntryPathToPending := true]]]