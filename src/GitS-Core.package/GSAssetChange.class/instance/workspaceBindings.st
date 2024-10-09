workspace
workspaceBindings
	^ (Dictionary newFrom: {
		'old' -> self from.
		'new' -> self to.
	}) collect: [:each | each ifNotNil: #asset]