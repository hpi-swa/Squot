history walking
performSearch
	[searchFrontier isEmpty or: stopRequested] whileFalse:
		[self visitVersion: searchFrontier removeFirst].