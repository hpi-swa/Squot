workspace
addWorkspaceBindings: aPluggableWorkspace
	self workspaceBindings keysAndValuesDo: [:name :value |
		aPluggableWorkspace bindings at: name put: value copy].