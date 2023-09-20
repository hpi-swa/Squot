workspace
initialWorkspaceContents
	^ '"Edit {1} by entering and saving code here. ',
	'The code must produce a {2} and may use the variables {3}, ',
	'which contain the respective versions."' format: {
		self workspaceEditTargetString.
		self versionTypeName.
		self workspaceVariableNamesString.
	}