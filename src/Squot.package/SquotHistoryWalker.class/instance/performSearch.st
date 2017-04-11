history walking
performSearch
	[searchFrontier isEmpty] whileFalse:
		[self visitVersion: searchFrontier removeFirst].