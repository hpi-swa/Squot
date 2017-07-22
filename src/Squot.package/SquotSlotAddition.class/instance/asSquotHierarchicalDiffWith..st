Squot-diff-converting
asSquotHierarchicalDiffWith: diffNodesBuilder
	self flag: #stub.
	^ {SquotDiffNode
		title: self hierarchicalDiffTitle
		content: self
		children: #()}