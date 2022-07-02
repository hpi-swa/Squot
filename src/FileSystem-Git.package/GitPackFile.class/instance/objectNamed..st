public-accessing
objectNamed: hexHash
	^ [self objectAtOffset: (indexFile offsetForObjectNamed: hexHash) hash: hexHash]
		on: NotFound do: [:error | error return: nil]