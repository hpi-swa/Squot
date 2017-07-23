accessing
moveTreeFrom: sourcePath to: targetPath
	| tree |
	tree := self treeAt: sourcePath.
	(self copiedTreeForModification: (self treeAt: targetPath parent) at: targetPath parent)
		putEntry: (GitTreeEntry
			directoryNamed: targetPath basename
			hash: tree hash
			in: repository).
	self markCreated: targetPath.
	self markDeleted: sourcePath.