ui
branchListIconAt: anIndex
	anIndex > 1 ifFalse: [^ nil].
	anIndex = indexOfActiveHistorianInBranchList
		ifTrue: [^ ToolIcons testGreen].
	(self projectSelection repository historianForTemporaryVersionsOn: (self projectSelection repository historianNamed: (self branchList at: anIndex))) ifNotNil: [:temporaryHistorian |
		temporaryHistorian version ifNotNil: [:temporaryVersion |
			(temporaryVersion parents notEmpty and: [(temporaryVersion patchRelativeToBase: temporaryVersion parents first) diffs notEmpty])
				ifTrue: [^ ToolIcons testOrange]]].
	anIndex > (indexOfFirstRemoteTrackingBranch ifNil: [self branchList size])
		ifTrue: [^ ToolIcons arrowUp].
	^ ToolIcons blank