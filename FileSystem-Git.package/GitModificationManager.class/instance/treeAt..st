private
treeAt: aPath
	| tree |
	treeMap
		at: aPath
		ifPresent: [ :aTree| ^ aTree].
	tree := (self lookupTreeAt: aPath)	
				ifNil: [ self newTreeAt: aPath ].
	treeMap at: aPath put: tree.
	^ tree 