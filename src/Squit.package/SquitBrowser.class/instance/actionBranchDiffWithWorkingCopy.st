actions on versions
actionBranchDiffWithWorkingCopy
	(SquotDiffExplorer
		from: selectedHistorian version
		to: self projectSelection)
	workingCopy: self projectSelection;
	openLabel: 'Changes in working copy compared to branch ', selectedHistorian shortName.