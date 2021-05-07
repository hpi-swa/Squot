initialize-release
initialize
	self initializeSearchFrontier.
	markedVersions := Dictionary new.
	sourceVersions := OrderedCollection new.
	sinkVersions := OrderedCollection new.