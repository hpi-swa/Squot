ui diff tree
rootNodes
	rootNodes ifNotNil: [ ^ rootNodes ].
	rootNodes := self createRootNodes.
	^ rootNodes