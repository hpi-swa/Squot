operations
resetChoiceForSelectedNode
	| selectedNode |
	selectedNode := self selectedNode.
	selectedNode resetChoice.
	self changed: #rootNodes.