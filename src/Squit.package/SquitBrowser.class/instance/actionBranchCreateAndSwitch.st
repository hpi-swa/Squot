actions on branches
actionBranchCreateAndSwitch
	| newHistorian |
	self hasBranchSelection ifFalse: [^ self].
	newHistorian := self createNewBranchAt: selectedHistorian version ifCanceled: [^ self].
	selectedHistorian := newHistorian.
	self actionBranchSwitch.