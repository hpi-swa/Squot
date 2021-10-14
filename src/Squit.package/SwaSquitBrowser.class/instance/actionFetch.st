actions
actionFetch

	| workingCopy |
	workingCopy := self selectedRepository.
	self withUnitOfWork: [self fetch: workingCopy].