actions on versions
actionCommitDiffWithWorkingCopy
	self withUnitOfWork:
	[(SquotDiffExplorer
		from: self commitSelection
		to: self projectSelection)
	workingCopy: self projectSelection;
	openLabel: 'Changes in working copy compared to ', self commitSelection printString].