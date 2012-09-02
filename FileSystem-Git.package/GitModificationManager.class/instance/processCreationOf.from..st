operations
processCreationOf: entries from: entryPath
	|tree childTree|
	entries
		select: [ :path | (cache referenceTo: path) isDirectory ]
		thenDo: [ :directory |
			childTree := (self treeAt: directory).
			"don't process empty trees for now"
			childTree isEmpty ifFalse: [
				tree := (self treeAt: entryPath) 
					putEntry: (GitTreeEntry
						fileNamed: directory basename
						hash: childTree hash).
				self flag: 'TODO: update refs only once after processing all deletes and creates'.
				self updateParentSignaturesOfChanged: tree at: entryPath.]]