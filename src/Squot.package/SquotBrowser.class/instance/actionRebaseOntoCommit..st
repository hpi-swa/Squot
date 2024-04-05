actions
actionRebaseOntoCommit: aCommit
	| commits |
	self activeWorkingCopyIfNilInformAnd: [^ self].
	commits := GitHistoryWalker new
		excludeAncestorsOf: aCommit;
		startingFrom: self activeWorkingCopy headCommit.
	self actionResetToCommit: aCommit.
	(SquotRebase newWithBrowser: self commits: commits reversed) open.