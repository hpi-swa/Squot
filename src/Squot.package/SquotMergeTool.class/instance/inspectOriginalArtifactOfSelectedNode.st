actions
inspectOriginalArtifactOfSelectedNode
	(self selectedNode content respondsTo: #isModification)
		ifTrue: [self selectedNode content left explore]
		ifFalse: [self selectedNode content working explore].