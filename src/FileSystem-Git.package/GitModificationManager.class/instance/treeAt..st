private
treeAt: aPath
	| tree |
	treeMap
		at: aPath
		ifPresent: [ :aTree| ^ aTree].
	tree := (self lookupTreeAt: aPath)	
				ifNil: [self logMessage: 'Creating empty tree because none existed at ', aPath printString.
					self newTreeAt: aPath].
	treeMap at: aPath put: tree.
	^ tree 