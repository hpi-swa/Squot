refs
headCommitIfNilInformAnd: aBlock
	^ self headCommit ifNil: [
		self inform: 'Please create a commit first.'.
		aBlock value]