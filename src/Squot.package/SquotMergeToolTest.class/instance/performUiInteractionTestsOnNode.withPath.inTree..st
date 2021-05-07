tests
performUiInteractionTestsOnNode: aSquotDiffNode withPath: aCollection inTree: treeView
	super performUiInteractionTestsOnNode: aSquotDiffNode withPath: aCollection inTree: treeView.
	tool selectedNode offersChoice ifTrue:
		[tool
			resetChoiceForSelectedNode;
			activateSelectedNode].