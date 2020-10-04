actions
toggleLoadSelectedNode
	self assert: self selectedNode isArtifactNode.
	self selectedNode isActive ifFalse: [self selectedNode include].
	self selectedNode artifactDiff toggleWhetherToLoad.
	self changed: #rootNodes.