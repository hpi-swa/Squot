operations
activateSelectedNode
	| selectedNode nodesToInclude |
	selectedNode := self selectedNode.
	nodesToInclude := selectedNode withAllChildren.
	nodesToInclude do: [:each | each include].
	self changed: #rootNodes.