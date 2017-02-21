public-adding
putEntry: anEntry
	entries at: anEntry entryName put: anEntry.
	self flushHash.