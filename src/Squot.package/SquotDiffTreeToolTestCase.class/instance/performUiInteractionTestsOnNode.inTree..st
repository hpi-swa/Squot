utilities
performUiInteractionTestsOnNode: aSquotDiffNode inTree: treeView 
	tool selectNode: aSquotDiffNode.
	treeView expandAll.
	tool nodeLabelOf: aSquotDiffNode.
	self assert: (tool diffText isString or: [tool diffText isText]).