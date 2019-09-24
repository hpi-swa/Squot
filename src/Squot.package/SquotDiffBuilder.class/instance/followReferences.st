private
followReferences
	[toBeVisited isEmpty] whileFalse:
		[self follow: toBeVisited removeFirst].
	diffedPair := nil.