history walking
startingFrom: aVersion
	versionBlock := nil.
	searchFrontier add: aVersion.
	self performSearch.
	^ versionList