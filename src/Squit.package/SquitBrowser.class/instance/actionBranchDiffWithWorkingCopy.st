actions on versions
actionBranchDiffWithWorkingCopy
	self withUnitOfWork:
	[(SquotDiffExplorer
		from: selectedHistorian version
		to: self projectSelection)
	workingCopy: self projectSelection;
	openLabel: 'Changes in working copy compared to branch ', selectedHistorian shortName].