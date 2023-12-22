actions
actionChooseNewRepositoryLocationForActiveProject
	(self activeWorkingCopyIfNilInformAnd: [^ self]) requestAndMoveToNewRepositoryLocation.
	self everythingChanged.