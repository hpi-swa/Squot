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
		add: 'Create a branch at this ', refTypeName, ' and switch to it'
		action: (isRef ifTrue: [#actionCreateBranchAtActiveRefAndSwitchToIt] ifFalse: [#actionCreateBranchAtActiveCommitAndSwitchToIt]);
		add: 'Create an external branch at this ', refTypeName
		help: 'The created branch will be visible from external git tools, like the git command line'
		action: (isRef ifTrue: [#actionCreateGitBranchAtActiveRef] ifFalse: [#actionCreateGitBranchAtActiveCommit]);
		addLine;
		add: 'Switch to this ', refTypeName, ' (detach HEAD)' action: #actionSwitchToActiveCommit;
		add: 'Restore this ', refTypeName action: #actionMaterializeActiveCommit;
		add: 'Merge this ', refTypeName action: (isRef ifTrue: [#actionMergeActiveRef] ifFalse: [#actionMergeActiveCommit]).
	branch := self activeWorkingCopy currentSymbolicHeadTarget.
	branch ifNotNil: [
		| resetLabel |
		resetLabel := 'Reset branch ''{1}'' to this ', refTypeName format: {GitReference shortName: branch}.
		aMenu
			add: resetLabel action: #actionResetToActiveCommit;
			add: resetLabel, ' and restore it' action: #actionResetToActiveCommitAndRestoreIt;
			add: ('Rebase branch ''{1}'' onto this ', refTypeName format: {GitReference shortName: branch})
			action: #actionRebaseOntoActiveCommit].
	aMenu
		addLine;
		add: 'Compare this ', refTypeName, ' to its parent commit' action: #actionCompareActiveCommitToParent;
		add: 'Compare this ', refTypeName, ' to the image' action: #actionCompareActiveCommitToImage.
	^ aMenu