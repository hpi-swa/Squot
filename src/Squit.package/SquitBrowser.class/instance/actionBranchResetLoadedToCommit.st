actions
actionBranchResetLoadedToCommit
	self projectSelection loadedHistorian version: self commitSelection version.
	self refresh.