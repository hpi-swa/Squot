private
updateEntryWithPath: entryPath in: parentTree toTree: aTree
	parentTree putEntry: (GitTreeEntry
		directoryNamed: entryPath basename
		hash: aTree hash
		in: repository).
	pendingPathsForEntryUpdate add: entryPath parent.