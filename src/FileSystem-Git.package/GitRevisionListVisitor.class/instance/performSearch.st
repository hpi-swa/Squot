visiting
performSearch
	[searchFrontier isEmpty] whileFalse:
		[self visit: searchFrontier removeFirst].