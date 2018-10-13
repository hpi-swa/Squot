ui
rootNodes
	diffRootNodes ifNotNil: [^ diffRootNodes].
	diffRootNodes := OrderedCollection new.
	editedPatch diffsDo: [:each | | nodes |
		nodes := each topNodes.
		nodes ifNotEmpty:
			[diffRootNodes add: (SquotDiffNode title: each path content: nil children: nodes)]].
	^ diffRootNodes