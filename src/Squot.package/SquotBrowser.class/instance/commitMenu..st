menu
commitMenu: aMenu
	self activeCommit ifNil: [^ aMenu].
	aMenu
		target: self;
		add: 'create a branch at this commit' action: #actionCreateBranchAtActiveCommit;
		add: 'switch to this commit (detach HEAD)' action: #actionSwitchToActiveCommit;
		add: 'materialize this commit' action: #actionMaterializeActiveCommit;
		add: 'create a CLI branch at this commit'
		help: 'the created branch will be visible from the git command line'
		action: #actionCreateGitBranchAtActiveCommit;
		add: 'merge this commit' action: #actionMergeActiveCommit.
	self activeWorkingCopy headRef isSymbolic ifTrue: [
		aMenu add: 'reset the current branch to this commit' action: #actionResetToActiveCommit].
	^ aMenu