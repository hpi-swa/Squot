actions on versions
actionCommitSwitchNewBranch
	| workingCopy |
	self commitSelection ifNil: [^ self].
	self withUnitOfWork:
	[workingCopy := self projectSelection.
	selectedHistorian := self createNewBranchAt: self commitSelection ifCanceled: [^ self].
	workingCopy switchTo: selectedHistorian.
	self loadBranchList; branchSelectionChanged].