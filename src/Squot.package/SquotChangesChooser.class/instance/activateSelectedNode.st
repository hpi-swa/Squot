actions
activateSelectedNode
	| nodesToInclude ancestorNodes |
	nodesToInclude := self selectedNode withAllChildren.
	nodesToInclude do: [:each | each include].
	ancestorNodes := selectedNodePath.
	ancestorNodes do: [:each | each include].
	self changed: #rootNodes.