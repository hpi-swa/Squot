ui
activeBranchChanged
	indexOfActiveHistorianInBranchList := branchList indexOf: self projectSelection loadedHistorian shortName.
	indexOfActiveHistorianInBranchList = 0
		ifTrue: [indexOfActiveHistorianInBranchList := 1 "after the label"].
	self changed: #branchList.