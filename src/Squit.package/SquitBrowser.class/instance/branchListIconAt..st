ui
branchListIconAt: anIndex
	anIndex > 1 ifFalse: [^ nil].
	anIndex = indexOfActiveHistorianInBranchList
		ifTrue: [^ ToolIcons testGreen].
	anIndex > (indexOfFirstRemoteTrackingBranch ifNil: [self branchList size])
		ifTrue: [^ ToolIcons arrowUp].
	^ ToolIcons blank