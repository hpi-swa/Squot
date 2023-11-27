migrations
doPostUpdateMigrationsIn: aWorkingCopy
	| version |
	version := self loadVersionFromImage: aWorkingCopy.
	(version isNil or: [self isValidVersion: version]) ifTrue: [^ self].
	version := self toAnimation: version.
	self materialize: version in: aWorkingCopy.