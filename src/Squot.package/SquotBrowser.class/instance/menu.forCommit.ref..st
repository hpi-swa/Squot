menu
menu: aMenu forCommit: aCommit ref: aStringOrNil
	| branch isRef refOrCommit |
	aCommit ifNil: [^ aMenu].
	isRef := aStringOrNil notNil.
	refOrCommit := isRef ifTrue: [aStringOrNil] ifFalse: [aCommit].
	aMenu
		target: self;
		
		add: 'Create a branch at it'
		selector: (isRef ifTrue: [#actionCreateBranchAtRef:] ifFalse: [#actionCreateBranchAtCommit:])
		argument: refOrCommit;
		
		add: 'Create a branch at it and switch to it'
		selector: (isRef ifTrue: [#actionCreateBranchAtRefAndSwitchToIt:] ifFalse: [#actionCreateBranchAtCommitAndSwitchToIt:])
		argument: refOrCommit;
		
		add: 'Create an external branch at it'
		selector: (isRef ifTrue: [#actionCreateGitBranchAtRef:] ifFalse: [#actionCreateGitBranchAtCommit:])
		argument: refOrCommit;
		balloonTextForLastItem: 'The created branch will be visible from external git tools, like the git command line';
		
		addLine;
		
		add: 'Switch to it (detach HEAD)'
		selector: #actionSwitchToCommit:
		argument: aCommit;
		
		add: 'Restore it'
		selector: #actionMaterializeCommit:
		argument: aCommit;
		
		add: 'Merge it'
		selector: (isRef ifTrue: [#actionMergeRef:] ifFalse: [#actionMergeCommit:])
		argument: refOrCommit.

	branch := self activeWorkingCopy currentSymbolicHeadTarget.
	branch ifNotNil: [
		| branchShortName resetLabel |
		branchShortName := (GitReference shortName: branch) printString.
		resetLabel := 'Reset branch {1} to it' format: {branchShortName}.
		aMenu
			add: resetLabel
			selector: #actionResetToCommit:
			argument: aCommit;
			
			add: resetLabel, ' and restore it'
			selector: #actionResetToCommitAndRestoreIt:
			argument: aCommit;
			
			add: ('Rebase branch {1} onto it' format: {branchShortName})
			selector: #actionRebaseOntoCommit:
			argument: aCommit].
	
	aMenu
		addLine;
		
		add: 'Compare it to its parent commit'
		selector: #actionCompareCommitToParent:
		argument: aCommit;
		
		add: 'Compare it to the image'
		selector: #actionCompareCommitToImage:
		argument: aCommit.
		
	^ aMenu