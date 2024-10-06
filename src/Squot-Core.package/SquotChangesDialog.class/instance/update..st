updating
update: aSymbol
	super update: aSymbol.
	({#isExcluded. #hasConflicts. #wasEdited} includes: aSymbol)
		ifTrue: [self changed: #rootNodes].