*Squot
asSquotHierarchicalDiff
	^ self diffIndices collect: [:each |
		SquotDiffNode title: 'diff chunk' content: each children: #()]