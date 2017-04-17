ui
actionIncludeDiffNode
	| selectedNode nodesToInclude |
	selectedNode := self diffSelectedNode.
	nodesToInclude := selectedNode withAllChildren.
	nodesToInclude do: [:each | each include].
	self changed: #diffRoots.