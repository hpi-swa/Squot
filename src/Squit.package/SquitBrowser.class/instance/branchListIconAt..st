ui
branchListIconAt: anIndex
	anIndex > 1 ifFalse: [^ nil].
	anIndex = indexOfActiveHistorianInBranchList
		ifTrue: [^ ToolIcons testGreen].
	^ ToolIcons blank