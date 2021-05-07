ui
activeBranchChanged
	indexOfActiveHistorianInBranchList := self hasProjectSelection
		ifTrue: [self branchList indexOf: self projectSelection loadedHistorian shortName]
		ifFalse: [0].
	indexOfActiveHistorianInBranchList = 0
		ifTrue: [indexOfActiveHistorianInBranchList := 1 "after the label"].
	self changed: #branchList.
