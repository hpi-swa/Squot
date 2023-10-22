actions
actionSwitchToActiveCommit
	| commit |
	self activeWorkingCopyIfNilInformAnd: [^ self].
	commit := self activeCommit.
	self
		actionSwitchToCommit: commit
		displayName: commit showOneLine
		updateHeadTo: commit asHexHash.