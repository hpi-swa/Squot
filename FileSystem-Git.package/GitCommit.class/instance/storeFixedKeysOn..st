storing
storeFixedKeysOn: aStream
	"Looking at builtin-commit-tree.c, the order of properties is fixed:
	tree, parents, author, committer, everything else, message."
	self saveKey: GitTree typeCode value: tree hexHash to: aStream.
	self basicParents do: [ :parentHash | self saveKey: 'parent' value: parentHash to: aStream].
	self saveKey: 'author' value: author printString to: aStream.
	self saveKey: 'committer' value: committer printString to: aStream.