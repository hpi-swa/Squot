actions on versions
actionCommitSwitchNewBranch
	| workingCopy |
	self commitSelection ifNil: [^ self].
	workingCopy := self projectSelection.
	selectedHistorian := self createNewBranchAt: self commitSelection ifCanceled: [^ self].
	workingCopy switchTo: selectedHistorian.
	self activeBranchChanged.