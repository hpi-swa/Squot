public-accessing
headerOfObjectNamed: hexHash
	^ [self headerOfObjectAtOffset: (indexFile offsetForObjectNamed: hexHash)]
		on: NotFound do: [:error | error return: nil]