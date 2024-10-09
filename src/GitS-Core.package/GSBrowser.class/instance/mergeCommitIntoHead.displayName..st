merging
mergeCommitIntoHead: aCommit displayName: aString
	| head mergeBases mergeBase |
	self activeWorkingCopyIfNilInformAnd: [^ self].
	aCommit ifNil: [^ self inform:
						('Cannot merge {1}, it does not refer to a commit.' format: {aString})].
	self warnIfImageNotClean: [^ self].
	head := self activeWorkingCopy headCommitIfNilInformAnd: [^ self].
	mergeBases := GSGUIUtilities
		displayStatus: 'Looking for a merge base'
		during: [head allMergeBasesWithAnyOf: {aCommit}].
	mergeBase := mergeBases size caseOf: {
		[0] -> [^ self inform: 'Cannot merge unrelated histories.'].
		[1] -> [mergeBases anyOne].
	} otherwise: [^ self inform: 'Found multiple merge bases. Recursive merging is currently unsupported.'].
	mergeBase = aCommit ifTrue: [^ self inform: 'Already up to date.'].
	mergeBase = head ifTrue: [
		^ (self
			openDialogToMaterializeCommit: aCommit
			windowTitlePrefix: 'Fast-forwarding: ') then:
				[:dialog | self activeWorkingCopy fastForwardTo: aCommit displayName: aString]].
	self
		openDialogToMergeCommitIntoHead: aCommit
		mergeBase: mergeBase
		displayName: aString.