ui
branchListIconAt: anIndex
	anIndex > 1 ifFalse: [^ nil].
	(self branchList at: anIndex) historian = self projectSelection loadedHistorian
		ifTrue: [^ ToolIcons testGreen].
	^ ToolIcons blank