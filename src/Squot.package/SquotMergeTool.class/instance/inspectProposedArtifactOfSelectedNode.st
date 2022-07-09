actions
inspectProposedArtifactOfSelectedNode
	(((self selectedNode content respondsTo: #isMerge) and: [self selectedNode content isMerge])
			or: [(self selectedNode content respondsTo: #isConflict) and: [self selectedNode content isConflict]])
		ifTrue: [self selectedNode content incoming explore]
		ifFalse: [^ super inspectProposedArtifactOfSelectedNode]