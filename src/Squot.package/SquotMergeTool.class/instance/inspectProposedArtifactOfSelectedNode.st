actions
inspectProposedArtifactOfSelectedNode
	(self selectedNode content respondsTo: #isModification)
		ifTrue:
			[self selectedNode content isRemoval
				ifTrue: [self inform: 'Object has been removed.']
				ifFalse: [self selectedNode content right explore]]
		ifFalse:
			[self selectedNode content incoming explore].