operations
processDeletionOf: entries from: entryPath
	"remove all the deleted files/paths from its parent (the current tree)"
	|  tree|
	entries ifEmpty: [^ self].
	tree := self treeAt: entryPath.
	entries do: [ :path |
		tree removeEntryAt: path basename ifAbsent: []].
	entryPath isRoot ifTrue: [ ^ self].
	pendingPathsForEntryUpdate add: entryPath.