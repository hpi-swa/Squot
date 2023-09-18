merging
mergeCommitIntoHead: aCommit displayName: aString
	| head mergeBases mergeBase changeSets |
	head := self workingCopy headCommit.
	mergeBases := head allMergeBasesWithAnyOf: {aCommit}.
	mergeBase := mergeBases size caseOf: {
		[0] -> [^ self inform: 'Cannot merge unrelated histories.'].
		[1] -> [mergeBases anyOne].
	} otherwise: [^ self inform: 'Found multiple merge bases. Recursive merging is currently unsupported.'].
	mergeBase = head ifTrue: [
		self inform: 'Fast-forwarding.'.
		^ self workingCopy fastForwardTo: aCommit displayName: aString].
	mergeBase = aCommit ifTrue: [
		^ self inform: 'Already up to date.'].
	changeSets := self workingCopy
						mergeCommit: aCommit
						into: head
						withBase: mergeBase.
	self openDialogToMergeChangeSets: changeSets from: aCommit displayName: aString.