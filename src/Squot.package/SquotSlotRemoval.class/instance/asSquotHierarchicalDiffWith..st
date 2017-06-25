Squot-diff-converting
asSquotHierarchicalDiffWith: diffNodesBuilder
	^ {SquotDiffNode
		title: self hierarchicalDiffTitle
		content: self
		children: #()}