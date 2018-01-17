actions
actionBranch
	self hasBranchSelection ifFalse: [^ self].
	selectedHistorian := self createNewBranchAt: selectedHistorian version ifCanceled: [^ self].
	(UIManager default chooseFrom: #('Switch and move over unsaved changes' 'Switch but leave unsaved changes at current branch' 'Stay at current branch') values: #(switchMoveOver switchClean stayAtCurrent) title: 'Do you want to switch to the new branch?')
		caseOf: 
		{[#switchMoveOver] -> [self actionBranchSwitchMoveOver].
		[#switchClean] -> [self actionBranchSwitch].
		[#stayAtCurrent] -> []}.
	self branchSelectionChanged.