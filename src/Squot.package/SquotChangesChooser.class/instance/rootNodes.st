ui diff tree
rootNodes
	rootNodes ifNotNil: [ ^ rootNodes ].
	rootNodes := self createRootNodes.
	rootNodes := self autoProcessNodes: rootNodes.
	^ rootNodes