ui
activeBranchChanged
	indexOfActiveHistorianInBranchList := branchList indexOf: self projectSelection loadedHistorian.
	indexOfActiveHistorianInBranchList = 0
		ifTrue: [indexOfActiveHistorianInBranchList := 1 "after the label"].