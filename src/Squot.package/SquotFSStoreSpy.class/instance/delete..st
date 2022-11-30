spying
delete: aPath
	self recordDelete: aPath.
	^ watchedStore delete: aPath