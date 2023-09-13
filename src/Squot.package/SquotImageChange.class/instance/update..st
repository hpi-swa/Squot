accessing
update: aSymbol
	super update: aSymbol.
	(aSymbol caseOf: {
		[#from] -> [#buildFrom].
		[#to] -> [#buildTo].
	} otherwise: [nil]) ifNotNil: [:symbol | self changed: symbol].