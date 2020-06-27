actions
activateSelectedNode
	| nodesToInclude |
	nodesToInclude := self selectedNode withAllChildren.
	nodesToInclude do: [:each | each include].
	self changed: #rootNodes.