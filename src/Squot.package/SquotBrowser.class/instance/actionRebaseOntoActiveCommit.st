actions
actionRebaseOntoActiveCommit
	| commits |
	self activeWorkingCopyIfNilInformAnd: [^ self].
	self activeCommit ifNil: [^ self inform: 'Please select a commit first.'].
	commits := GitHistoryWalker new
		excludeAncestorsOf: self activeCommit;
		startingFrom: self activeWorkingCopy headCommit.
	(SquotInteractiveRebase newWithCommits: commits) open.