actions
inspectOriginalArtifactOfSelectedNode
	(((self selectedNode content respondsTo: #isMerge) and: [self selectedNode content isMerge])
			or: [(self selectedNode content respondsTo: #isConflict) and: [self selectedNode content isConflict]])
		ifTrue: [self selectedNode content working explore]
		ifFalse: [^ super inspectOriginalArtifactOfSelectedNode]