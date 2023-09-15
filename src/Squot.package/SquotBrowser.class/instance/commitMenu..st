menu
commitMenu: aMenu
	aMenu
		target: self;
		add: 'create a branch at this commit' action: #actionCreateBranchAtActiveCommit.
	^ aMenu