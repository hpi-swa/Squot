workspace
initialWorkspaceContents
	^ '"Edit {1} by entering and saving code here. ',
	'The code must produce a Form or nil and may use the variables {2}, ',
	'which contain the respective Forms."' format: {
		self workspaceEditTargetString.
		self workspaceVariableNamesString.
	}