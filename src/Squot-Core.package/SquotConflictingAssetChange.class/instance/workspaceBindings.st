workspace
workspaceBindings
	^ Dictionary newFrom: {
		'current' -> self left.
		'incoming' -> self right.
		'base' -> self base.
		'resolution' -> self resolution.
	}
	