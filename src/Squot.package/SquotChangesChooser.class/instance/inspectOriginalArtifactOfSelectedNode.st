actions
inspectOriginalArtifactOfSelectedNode
	self selectedNode content isAddition ifTrue: [^ SquotGUI inform: 'Object did not exist yet'].
	self selectedNode content left explore.