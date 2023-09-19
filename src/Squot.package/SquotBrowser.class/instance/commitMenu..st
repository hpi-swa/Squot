menu
commitMenu: aMenu
	aMenu
		target: self;
		add: 'create a branch at this commit' action: #actionCreateBranchAtActiveCommit;
		add: 'switch to this commit (detach HEAD)' action: #actionSwitchToActiveCommit.
	^ aMenu