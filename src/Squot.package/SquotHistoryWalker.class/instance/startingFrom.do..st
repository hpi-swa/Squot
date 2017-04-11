history walking
startingFrom: aVersion do: aBlock
	versionBlock := aBlock.
	searchFrontier add: aVersion.
	self performSearch.