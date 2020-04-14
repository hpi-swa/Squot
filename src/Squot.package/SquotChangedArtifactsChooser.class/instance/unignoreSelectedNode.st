actions
unignoreSelectedNode
	self selectedNode content ifNil: [^ self].
	self selectedNode unignore.
	self activateSelectedNode.