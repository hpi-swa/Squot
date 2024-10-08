actions
actionChooseNewRepositoryLocationForActiveProject
	self workingCopyAction: [:workingCopy |
		workingCopy requestAndMoveToNewRepositoryLocation.
		self everythingChanged].