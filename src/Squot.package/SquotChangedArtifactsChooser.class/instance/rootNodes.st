ui diff tree
rootNodes
	rootNodes ifNotNil: [^ rootNodes].
	rootNodes := OrderedCollection new.
	editedPatch diffsDo: [:each | | root |
		root := each asDiffTree.
		each setUpTreeRoot: root toEditPatch: editedPatch.
		rootNodes add: root].
	^ rootNodes