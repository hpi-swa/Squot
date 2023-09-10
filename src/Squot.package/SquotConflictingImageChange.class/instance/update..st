updating
update: aSymbol
	super update: aSymbol.
	aSymbol = #resolution ifTrue: [self changed: #resolutionPanel].
	aSymbol = #isResolved ifTrue: [self changed: #headText].