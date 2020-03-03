public-accessing
tree
	^ tree ifNil: [tree := self currentUnitOfWork objectNamed: treeHash]