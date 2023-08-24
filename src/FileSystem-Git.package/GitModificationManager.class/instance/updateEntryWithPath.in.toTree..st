private
updateEntryWithPath: entryPath in: parentTree toTree: aTree
	self assert: (copiedTrees includes: parentTree).
	parentTree putEntry: (GitOwningTreeEntry
		directory: aTree
		named: entryPath basename
		in: repository).
	pendingPathsForEntryUpdate add: entryPath parent.