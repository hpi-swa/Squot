ui diff tree
rootNodes
	rootNodes ifNotNil: [^ rootNodes].
	rootNodes := OrderedCollection new.
	editedPatch diffsDo: [:each | | nodes |
		nodes := each topNodes.
		nodes ifNotEmpty:
			[rootNodes add: (SquotDiffNode title: each path content: nil children: nodes)]].
	^ rootNodes