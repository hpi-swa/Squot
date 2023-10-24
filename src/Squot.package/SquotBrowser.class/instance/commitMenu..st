menu
commitMenu: aMenu
	| branch |
	self activeCommit ifNil: [^ aMenu].
	aMenu
		target: self;
		add: 'Create a branch at this commit' action: #actionCreateBranchAtActiveCommit;
		add: 'Create an external branch at this commit'
		help: 'The created branch will be visible from external git tools, like the git command line'
		action: #actionCreateGitBranchAtActiveCommit;
		addLine;
		add: 'Switch to this commit (detach HEAD)' action: #actionSwitchToActiveCommit;
		add: 'Restore this commit' action: #actionMaterializeActiveCommit;
		add: 'Merge this commit' action: #actionMergeActiveCommit.
	branch := self activeWorkingCopy currentSymbolicHeadTarget.
	branch ifNotNil: [
		aMenu
			add: ('Reset branch ''{1}'' to this commit' format: {GitReference shortName: branch})
			action: #actionResetToActiveCommit].
	aMenu
		addLine;
		add: 'Compare this commit to its parent' action: #actionCompareActiveCommitToParent.
	^ aMenu