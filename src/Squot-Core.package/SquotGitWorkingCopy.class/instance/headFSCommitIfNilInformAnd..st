refs
headFSCommitIfNilInformAnd: aBlock
	^ self fsCommitFrom: (self headCommitIfNilInformAnd: [^ aBlock value])