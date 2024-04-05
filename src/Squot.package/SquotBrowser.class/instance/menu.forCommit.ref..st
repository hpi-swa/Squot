menu
menu: aMenu forCommit: aCommit ref: aStringOrNil
	| branch isRef refOrCommit refTypeName |
	aCommit ifNil: [^ aMenu].
	isRef := aStringOrNil notNil.
	refOrCommit := isRef ifTrue: [aStringOrNil] ifFalse: [aCommit].
	refTypeName := self refTypeName: aStringOrNil.
	aMenu
		target: self;
		
		add: 'Create a branch at this ', refTypeName
		selector: (isRef ifTrue: [#actionCreateBranchAtRef:] ifFalse: [#actionCreateBranchAtCommit:])
		argument: refOrCommit;
		
		add: 'Create a branch at this ', refTypeName, ' and switch to it'
		selector: (isRef ifTrue: [#actionCreateBranchAtRefAndSwitchToIt:] ifFalse: [#actionCreateBranchAtCommitAndSwitchToIt:])
		argument: refOrCommit;
		
		add: 'Create an external branch at this ', refTypeName
		selector: (isRef ifTrue: [#actionCreateGitBranchAtRef:] ifFalse: [#actionCreateGitBranchAtCommit:])
		argument: refOrCommit;
		balloonTextForLastItem: 'The created branch will be visible from external git tools, like the git command line';
		
		addLine;
		
		add: 'Switch to this ', refTypeName, ' (detach HEAD)'
		selector: #actionSwitchToCommit:
		argument: aCommit;
		
		add: 'Restore this ', refTypeName
		selector: #actionMaterializeCommit:
		argument: aCommit;
		
		add: 'Merge this ', refTypeName
		selector: (isRef ifTrue: [#actionMergeRef:] ifFalse: [#actionMergeCommit:])
		argument: refOrCommit.

	branch := self activeWorkingCopy currentSymbolicHeadTarget.
	branch ifNotNil: [
		| resetLabel |
		resetLabel := 'Reset branch ''{1}'' to this ', refTypeName format: {GitReference shortName: branch}.
		aMenu
			add: resetLabel
			selector: #actionResetToCommit:
			argument: aCommit;
			
			add: resetLabel, ' and restore it'
			selector: #actionResetToCommitAndRestoreIt:
			argument: aCommit;
			
			add: ('Rebase branch ''{1}'' onto this ', refTypeName format: {GitReference shortName: branch})
			selector: #actionRebaseOntoCommit:
			argument: aCommit].
	
	aMenu
		addLine;
		
		add: 'Compare this ', refTypeName, ' to its parent commit'
		selector: #actionCompareCommitToParent:
		argument: aCommit;
		
		add: 'Compare this ', refTypeName, ' to the image'
		selector: #actionCompareCommitToImage:
		argument: aCommit.
		
	^ aMenu