updating
update: aSymbol
	super update: aSymbol.
	aSymbol = #isExcluded ifTrue: [self changed: #rootNodes].