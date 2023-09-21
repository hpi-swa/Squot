menu
commitMenu: aMenu
	self activeCommit ifNil: [^ aMenu].
	aMenu
		target: self;
		add: 'create a branch at this commit' action: #actionCreateBranchAtActiveCommit;
		add: 'switch to this commit (detach HEAD)' action: #actionSwitchToActiveCommit;
		add: 'materialize this commit' action: #actionMaterializeActiveCommit.
	^ aMenu