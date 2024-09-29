migrations
doPostUpdateMigrationsIn: aWorkingCopy
	super doPostUpdateMigrationsIn: aWorkingCopy.
	self fixNilEncoding.