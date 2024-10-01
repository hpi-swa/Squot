migrations
doPostUpdateMigrationsIn: aWorkingCopy
	self fallbackToLegacyVersion.
	self isTracked ifNil: [self isTracked: true].