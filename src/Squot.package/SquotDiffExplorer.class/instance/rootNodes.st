ui diff tree
rootNodes
	rootNodes ifNotNil: [^ rootNodes].
	rootNodes := Array streamContents: [:stream |
		patch diffsDo: [:each | | nodes |
			nodes := each topNodes.
			nodes ifNotEmpty:
				[stream nextPut: (SquotDiffNode title: each path content: nil children: nodes)]]].
	^ rootNodes