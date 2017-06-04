ui
branchListIconAt: anIndex
	anIndex > 1 ifFalse: [^ nil].
	anIndex - 1 = indexOfActiveHistorianInBranchList
		ifTrue: [^ ToolIcons testGreen].
	^ ToolIcons blank