public-accessing
tree
	^ tree ifNil: [tree := self repository objectNamed: treeHash]