tests
performUiInteractionTestsOnNode: aSquotDiffNode withPath: aCollection inTree: treeView
	super performUiInteractionTestsOnNode: aSquotDiffNode withPath: aCollection inTree: treeView.
	tool deactivateSelectedNode.
	tool activateSelectedNode.
	((treeView getMenu: false) items anySatisfy: [:each | #toggleLoadSelectedNode = each selector])
		ifTrue:
			[| initially | initially := tool selectedNode content willBeLoaded.
			tool toggleLoadSelectedNode.
			self assert: initially not equals: tool selectedNode content willBeLoaded.
			tool toggleLoadSelectedNode.
			self assert: initially equals: tool selectedNode content willBeLoaded].