accessing
nameOf: aPath
	| tree |
	tree := treeMap at: aPath parent.
	^ (tree entryAt: aPath basename) objectSignature hexHash