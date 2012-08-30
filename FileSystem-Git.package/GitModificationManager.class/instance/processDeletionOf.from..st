operations
processDeletionOf: entries from: entryPath
	"remove all the deleted files/paths from its parent (the current tree)"
	|  target tree|
	tree := self treeAt: entryPath.
	entries do: [ :path |
		tree removeEntryAt: path basename ifAbsent: []].
	entryPath isRoot ifTrue: [ ^ self].
	"update the entry in the repository with the new tree"
	self flag: 'TODO: update refs only once after processing all deletes and creates'.
	self updateParentSignaturesOfChanged: tree at: entryPath.