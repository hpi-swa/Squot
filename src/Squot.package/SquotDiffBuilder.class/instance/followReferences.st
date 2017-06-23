as yet unclassified
followReferences
	[toBeVisited isEmpty] whileFalse:
		[self follow: toBeVisited removeFirst].
	diffedPair := nil.