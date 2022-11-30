actions
inspectProposedArtifactOfSelectedNode
	self selectedNode content isRemoval ifTrue: [^ SquotGUI inform: 'Object was removed'].
	self selectedNode content right explore.