tests
performUiInteractionTestsOnNode: aSquotDiffNode inTree: treeView
	super performUiInteractionTestsOnNode: aSquotDiffNode inTree: treeView.
	tool deactivateSelectedNode.
	tool activateSelectedNode