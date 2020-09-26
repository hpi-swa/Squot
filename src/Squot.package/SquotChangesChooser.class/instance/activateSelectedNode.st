actions
activateSelectedNode
	| nodesToInclude ancestorNodes |
	nodesToInclude := self selectedNode withAllChildren.
	nodesToInclude do: [:each | each include].
	ancestorNodes := selectedNodePath ifNil: [Array empty].
	ancestorNodes allButLastDo: [:each | each include].
	self changed: #rootNodes.