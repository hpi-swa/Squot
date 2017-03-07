public-accessing
objectNamed: hexHash
	^ [self objectAtOffset: (indexFile offsetForObjectNamed: hexHash)]
		on: NotFound do: [:error | error return: nil]