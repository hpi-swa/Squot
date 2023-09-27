accessing
update: aSymbol
	super update: aSymbol.
	(aSymbol caseOf: {
		[#from] -> [#buildFrom:].
		[#to] -> [#buildTo:].
		[#hasConflicts] -> [#hasConflicts].
	} otherwise: [nil]) ifNotNil: [:symbol | self changed: symbol].