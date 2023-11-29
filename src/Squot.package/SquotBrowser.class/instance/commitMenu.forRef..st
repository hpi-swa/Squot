menu
commitMenu: aMenu forRef: aStringOrNil
	| branch isRef refTypeName |
	self activeCommit ifNil: [^ aMenu].
	isRef := aStringOrNil notNil.
	refTypeName := self refTypeName: aStringOrNil.
	aMenu
		target: self;
		add: 'Create a branch at this ', refTypeName
		action: (isRef ifTrue: [#actionCreateBranchAtActiveRef] ifFalse: [#actionCreateBranchAtActiveCommit]);
		add: 'Create an external branch at this ', refTypeName
		help: 'The created branch will be visible from external git tools, like the git command line'
		action: (isRef ifTrue: [#actionCreateGitBranchAtActiveRef] ifFalse: [#actionCreateGitBranchAtActiveCommit]);
		addLine;
		add: 'Switch to this ', refTypeName, ' (detach HEAD)' action: #actionSwitchToActiveCommit;
		add: 'Restore this ', refTypeName action: #actionMaterializeActiveCommit;
		add: 'Merge this ', refTypeName action: (isRef ifTrue: [#actionMergeActiveRef] ifFalse: [#actionMergeActiveCommit]).
	branch := self activeWorkingCopy currentSymbolicHeadTarget.
	branch ifNotNil: [
		aMenu
			add: ('Reset branch ''{1}'' to this ', refTypeName format: {GitReference shortName: branch})
			action: #actionResetToActiveCommit].
	aMenu
		addLine;
		add: 'Compare this ', refTypeName, ' to its parent commit' action: #actionCompareActiveCommitToParent.
	^ aMenu