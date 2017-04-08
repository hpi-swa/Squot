history walking
performSearch
	[searchFrontier isEmpty] whileFalse:
		[self visitCommit: searchFrontier removeFirst].