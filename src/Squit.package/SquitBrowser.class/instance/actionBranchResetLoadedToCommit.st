actions on versions
actionBranchResetLoadedToCommit
	self projectSelection loadedHistorian version: self commitSelection.
	self refresh.