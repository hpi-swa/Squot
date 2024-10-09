ref-tree
refTreeRoots
	| other roots |
	roots := {
		'local branches' -> self branchesBaseName.
	}, (self remoteNames collect: [:each |
			('remote branches on {1}' format: {each printString})
				-> (self remoteRefBaseName, each, $/)]), {
		'external branches' -> self gitBranchesBaseName.
		'tags' -> 'refs/tags/'.
	} collect: [:each | self newRefTreeWithLabel: each key ref: each value].
	other := self newRefTreeWithLabel: 'other refs' ref: ''.
	self allReferences do: [:ref |
		self flag: #todo. "handle HEAD refs and refs from other squeak images"
		roots
			detect: [:each | ref beginsWith: each ref]
			ifFound: [:root | root add: (ref allButFirst: root ref size)]
			ifNone: [other add: ref]].
	roots := roots copyWith: other.
	roots do: #compressChildren.
	^ roots reject: #isEmpty