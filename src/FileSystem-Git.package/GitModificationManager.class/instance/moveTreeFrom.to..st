accessing
moveTreeFrom: sourcePath to: targetPath
	| tree |
	tree := self treeAt: sourcePath.
	(self copiedTreeForModification: (self treeAt: targetPath parent) at: targetPath parent)
		putEntry: (GitOwningTreeEntry
			directory: tree
			named: targetPath basename
			in: repository).
	self markCreated: targetPath.
	self markDeleted: sourcePath.