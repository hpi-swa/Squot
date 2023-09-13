updating
update: aSymbol
	super update: aSymbol.
	(aSymbol caseOf: {
		[#left] -> [#buildLeft].
		[#right] -> [#buildRight].
		[#base] -> [#buildBase].
		[#resolution] -> [#buildResolution].
		[#isResolved] -> [#headText].
	} otherwise: [nil]) ifNotNil: [:symbol | self changed: symbol].