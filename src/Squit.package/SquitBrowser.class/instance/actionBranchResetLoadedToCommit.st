actions on versions
actionBranchResetLoadedToCommit
	self withUnitOfWork:
	[self projectSelection loadedHistorian version: self commitSelection.
	self refresh].