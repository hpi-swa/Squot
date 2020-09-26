utilities
performUiInteractionTestsOnNode: aSquotDiffNode withPath: aCollection inTree: treeView
	super performUiInteractionTestsOnNode: aSquotDiffNode withPath: aCollection inTree: treeView.
	((treeView getMenu: false) items anySatisfy: [:each | #ignoreSelectedNode = each selector]) ifTrue:
		[tool ignoreSelectedNode.
		self deny: tool selectedNode isActive;
			assert: ((treeView getMenu: false) items anySatisfy: [:each | #unignoreSelectedNode = each selector]) description: 'Cannot unignore previously ignored node'.
		tool unignoreSelectedNode.
		self assert: tool selectedNode isActive].