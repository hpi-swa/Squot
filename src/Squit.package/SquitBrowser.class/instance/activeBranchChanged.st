ui
activeBranchChanged
	indexOfActiveHistorianInBranchList := self projectSelection
		ifNil: [0]
		ifNotNil: [:p | p branchList indexOf: self projectSelection loadedHistorian shortName].
	indexOfActiveHistorianInBranchList = 0
		ifTrue: [indexOfActiveHistorianInBranchList := 1 "after the label"].
	self changed: #branchList.
