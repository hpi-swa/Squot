ui
diffRoots
	diffRootNodes ifNotNil: [^ diffRootNodes].
	diffRootNodes := OrderedCollection new.
	diffs do: [:each | | nodes |
		nodes := each topNodes.
		nodes ifNotEmpty:
			[diffRootNodes add: (SquotDiffNode title: each path content: nil children: nodes)]].
	^ diffRootNodes