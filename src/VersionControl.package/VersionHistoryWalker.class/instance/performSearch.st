private
performSearch
	[searchFrontier isEmpty or: [stopRequested
	or: (searchFrontier noneSatisfy: #isPromisingForContinuedWalk)]] whileFalse:
		[self visitVersion: searchFrontier removeFirst].