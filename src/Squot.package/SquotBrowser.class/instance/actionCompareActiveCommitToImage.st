actions
actionCompareActiveCommitToImage
	self actionCompareCommitToImage: (self activeCommitIfNilInformAnd: [^ self]).