tests
performUiInteractionTestsOnNode: aSquotDiffNode withPath: aCollection inTree: treeView
	super performUiInteractionTestsOnNode: aSquotDiffNode withPath: aCollection inTree: treeView.
	tool deactivateSelectedNode.
	tool activateSelectedNode