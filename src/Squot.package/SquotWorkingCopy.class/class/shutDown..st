system startup
shutDown: isQuitting
	self registered do: [:each | each updateLastLoadedHistorianName].
	