*Squot-diff-content
asSquotHierarchicalDiffWith: aDiffNodesBuilder
	^ snippets collect: [:each |
		SquotDiffNode title: 'diff chunk' content: (SquotGenericDiffSnippet newFrom: each) children: #()]