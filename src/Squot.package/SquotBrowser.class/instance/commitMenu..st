menu
commitMenu: aMenu
	| branch |
	self activeCommit ifNil: [^ aMenu].
	aMenu
		target: self;
		add: 'create a branch at this commit' action: #actionCreateBranchAtActiveCommit;
		add: 'create an external branch at this commit'
		help: 'the created branch will be visible from external git tools, like the git command line'
		action: #actionCreateGitBranchAtActiveCommit;
		addLine;
		add: 'switch to this commit (detach HEAD)' action: #actionSwitchToActiveCommit;
		add: 'restore this commit' action: #actionMaterializeActiveCommit;
		add: 'merge this commit' action: #actionMergeActiveCommit.
	branch := self activeWorkingCopy currentSymbolicHeadTarget.
	branch ifNotNil: [
		aMenu
			add: ('reset branch ''{1}'' to this commit' format: {GitReference shortName: branch})
			action: #actionResetToActiveCommit].
	aMenu
		addLine;
		add: 'compare this commit to its parent' action: #actionCompareActiveCommitToParent.
	^ aMenu