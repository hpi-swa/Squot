testing
performUiInteractionTestsOnNode: aSquotDiffNode inTree: treeView 
	tool selectNode: aSquotDiffNode.
	treeView expandAll.
	tool nodeLabelOf: aSquotDiffNode.