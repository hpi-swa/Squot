menu
commitMenu: aMenu forRef: aStringOrNil
	| branch isRef |
	self activeCommit ifNil: [^ aMenu].
	isRef := aStringOrNil notNil.
	aMenu
		target: self;
		add: 'Create a branch at it'
		action: (isRef ifTrue: [#actionCreateBranchAtActiveRef] ifFalse: [#actionCreateBranchAtActiveCommit]);
		add: 'Create a branch at it and switch to it'
		action: (isRef ifTrue: [#actionCreateBranchAtActiveRefAndSwitchToIt] ifFalse: [#actionCreateBranchAtActiveCommitAndSwitchToIt]);
		add: 'Create an external branch at it'
		help: 'The created branch will be visible from external git tools, like the git command line'
		action: (isRef ifTrue: [#actionCreateGitBranchAtActiveRef] ifFalse: [#actionCreateGitBranchAtActiveCommit]);
		addLine;
		add: 'Switch to it (detach HEAD)' action: #actionSwitchToActiveCommit;
		add: 'Restore it' action: #actionMaterializeActiveCommit;
		add: 'Merge it' action: (isRef ifTrue: [#actionMergeActiveRef] ifFalse: [#actionMergeActiveCommit]).
	branch := self activeWorkingCopy currentSymbolicHeadTarget.
	branch ifNotNil: [
		| resetLabel |
		resetLabel := 'Reset branch {1} to it' format: {(GitReference shortName: branch) printString}.
		aMenu
			add: resetLabel action: #actionResetToActiveCommit;
			add: resetLabel, ' and restore it' action: #actionResetToActiveCommitAndRestoreIt].
	aMenu
		addLine;
		add: 'Compare it to its parent commit' action: #actionCompareActiveCommitToParent;
		add: 'Compare it to the image' action: #actionCompareActiveCommitToImage.
	^ aMenu