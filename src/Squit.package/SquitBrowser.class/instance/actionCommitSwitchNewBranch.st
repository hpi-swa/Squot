actions on versions
actionCommitSwitchNewBranch
	self commitSelection ifNil: [^ self].
	selectedHistorian := self createNewBranchAt: self commitSelection ifCanceled: [^ self].
	self projectSelection switchTo: selectedHistorian.
	self activeBranchChanged.