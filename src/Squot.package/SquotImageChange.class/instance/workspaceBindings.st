workspace
workspaceBindings
	^ Dictionary newFrom: {
		'old' -> self from.
		'new' -> self to.
	}