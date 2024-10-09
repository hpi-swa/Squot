actions
actionRebaseOntoCommit: aCommit
	| workingCopy commits rebase |
	workingCopy := self activeWorkingCopyIfNilInformAnd: [^ self].
	commits := GitHistoryWalker new
					excludeAncestorsOf: aCommit;
					startingFrom: workingCopy headCommit.
	rebase := GSRebase newWithBrowser: self commits: commits reversed.
	rebase start then: [:x |
		workingCopy
			updateHeadToAndMaterialize: aCommit
			message: 'rebase (start): checkout ', aCommit hexHash.
		rebase open].