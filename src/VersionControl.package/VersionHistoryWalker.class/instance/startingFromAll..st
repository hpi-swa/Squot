history walking
startingFromAll: aCollectionOfVersions
	versionBlock := nil.
	searchFrontier addAll: aCollectionOfVersions.
	self performSearch.
	^ versionList