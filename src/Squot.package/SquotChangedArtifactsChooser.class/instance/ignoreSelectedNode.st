actions
ignoreSelectedNode
	self selectedNode content ifNil: [^ self].
	self selectedNode ignore.
	self deactivateSelectedNode.