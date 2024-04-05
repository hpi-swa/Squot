actions
actionSwitchToCommit: aCommit
	self activeWorkingCopyIfNilInformAnd: [^ self].
	self
		actionSwitchToCommit: aCommit
		displayName: aCommit showOneLine
		updateHeadTo: aCommit asHexHash.