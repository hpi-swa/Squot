actions on versions
actionBranchResetToCommit
	self hasBranchSelection ifFalse: [^ self].
	selectedHistorian version: self commitSelection.
	self changed: #commitList.