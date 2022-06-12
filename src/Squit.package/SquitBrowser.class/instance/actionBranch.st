actions
actionBranch
	| nameSuggestion |
	self hasBranchSelection ifFalse: [^ self].
	self withUnitOfWork:
	[nameSuggestion :=
		selectedHistorian isRemoteTrackingHistorian
			ifTrue: [selectedHistorian remoteRef shortName]
			ifFalse: [''].
	selectedHistorian := self createNewBranchAt: selectedHistorian version
		initialName: nameSuggestion
		ifCanceled: [^ self].
	self loadBranchList; branchSelectionChanged.
	(SquotGUI chooseOptionFrom: #('Switch and move over unsaved changes' 'Switch but leave unsaved changes at current branch' 'Stay at current branch') values: #(switchMoveOver switchClean stayAtCurrent) title: 'Do you want to switch to the new branch?')
		caseOf: 
		{[#switchMoveOver] -> [self actionBranchSwitchMoveOver].
		[#switchClean] -> [self actionBranchSwitch].
		[#stayAtCurrent] -> [].
		[nil] -> []}].