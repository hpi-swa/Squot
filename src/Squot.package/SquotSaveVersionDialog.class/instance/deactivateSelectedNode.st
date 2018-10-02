ui
deactivateSelectedNode
	| selectedNode nodesToExclude |
	selectedNode := self diffSelectedNode.
	nodesToExclude := selectedNode withAllChildren.
	nodesToExclude do: [:each | each exclude].
	self changed: #rootNodes.