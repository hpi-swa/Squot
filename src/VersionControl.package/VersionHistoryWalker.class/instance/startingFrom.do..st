history walking
startingFrom: aVersion do: aBlock
	aVersion ifNil: [^ self].
	versionBlock := aBlock.
	searchFrontier add: aVersion.
	self performSearch.