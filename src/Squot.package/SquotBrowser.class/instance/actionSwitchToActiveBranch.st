actions
actionSwitchToActiveBranch
	| ref |
	self activeWorkingCopyIfNilInformAnd: [^ self].
	ref := self activeRef.
	self
		actionSwitchToCommit: (self unitOfWork objectReferenced: ref)
		displayName: (GitReference shortName: ref)
		updateHeadTo: ref.