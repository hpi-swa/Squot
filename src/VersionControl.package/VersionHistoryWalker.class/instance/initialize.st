initialize-release
initialize
	versionList := OrderedCollection new.
	self initializeSearchFrontier.
	markedVersions := Dictionary new.
	stopRequested := false.