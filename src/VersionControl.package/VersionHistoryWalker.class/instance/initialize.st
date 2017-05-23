initialize-release
initialize
	seen := Set new.
	versionList := OrderedCollection new.
	self initializeSearchFrontier.
	sinkVersions := Set new.
	stopRequested := false.