storing
storeFixedKeysOn: aStream
	"Looking at builtin-commit-tree.c, the order of properties is fixed:
	tree, parents, author, committer, everything else, message."
	self saveKey: GitTree typeCode value: treeHash to: aStream.
	self basicParents do: [ :parentHash | self saveKey: 'parent' value: parentHash to: aStream].
	self saveKey: 'author' value: (self tryEncodeString: author printString) to: aStream.
	self saveKey: 'committer' value: (self tryEncodeString: committer printString) to: aStream.