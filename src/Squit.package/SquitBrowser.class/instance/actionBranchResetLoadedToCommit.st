actions on versions
actionBranchResetLoadedToCommit
	self withUnitOfWork:
	[self projectSelection hasAdditionalParents
		ifTrue: [(SquotGUI confirm: 'Looks like you are in the middle of a merge. If you reset to this commit, the commits you merged ', String cr, 'will be no longer remembered as ancestors of the next commit you are going to make.', String cr, 'Proceed with the reset?')
				ifFalse: [^ nil]].
	self projectSelection resetAdditionalParents.
	self projectSelection loadedHistorian version: self commitSelection.
	self refresh].