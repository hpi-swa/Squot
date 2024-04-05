accessing
activeCommitIfNilInformAnd: aBlock
	self activeWorkingCopyIfNilInformAnd: aBlock.
	^ self activeCommit ifNil: [
		self inform: 'Please select a commit first.'.
		aBlock value]