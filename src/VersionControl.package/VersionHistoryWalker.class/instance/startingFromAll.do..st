history walking
startingFromAll: aCollectionOfVersions do: aBlock
	versionBlock := aBlock.
	searchFrontier addAll: aCollectionOfVersions.
	self performSearch.