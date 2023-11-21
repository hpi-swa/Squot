moving
uncheckedMoveTo: aPath in: aWorkingCopy
	| version |
	version := self loadVersionFromImage: aWorkingCopy.
	self
		materialize: nil in: aWorkingCopy;
		path: aPath;
		materialize: version in: aWorkingCopy.