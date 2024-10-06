moving
requestAndMoveToNewRepositoryLocation
	self moveToNewRepositoryLocation: (self requestNewRepositoryLocation ifNil: [^ self]).