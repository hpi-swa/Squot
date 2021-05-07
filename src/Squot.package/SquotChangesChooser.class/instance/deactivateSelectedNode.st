actions
deactivateSelectedNode
	| nodesToExclude |
	nodesToExclude := self selectedNode withAllChildren.
	nodesToExclude do: [:each | each exclude].
	self changed: #rootNodes.