actions
deactivateSelectedNode
	| selectedNode nodesToExclude |
	selectedNode := self selectedNode.
	nodesToExclude := selectedNode withAllChildren.
	nodesToExclude do: [:each | each exclude].
	self changed: #rootNodes.