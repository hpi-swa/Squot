stepping
stepAt: millisecondClockValue in: aWindow
	(Preferences smartUpdating and: [(millisecondClockValue - self timeOfLastListUpdate) > 8000]) "Not more often than once every 8 seconds"
		ifTrue: [self refresh. timeOfLastListUpdate := millisecondClockValue].