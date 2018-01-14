private
followReferences
	[toBeVisited isEmpty] whileFalse:
		[self follow: toBeVisited removeFirst element].