ui
actionExcludeDiffNode
	| selectedNode nodesToExclude |
	selectedNode := self diffSelectedNode.
	nodesToExclude := selectedNode withAllChildren.
	nodesToExclude do: [:each | each exclude].
	self changed: #diffRoots.