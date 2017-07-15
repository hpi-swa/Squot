ui
branchSelectionChanged
	self changed: #branchSelection.
	self loadCommitList.
	self commitSelection: selectedHistorian version.
	self changed: #labelString.