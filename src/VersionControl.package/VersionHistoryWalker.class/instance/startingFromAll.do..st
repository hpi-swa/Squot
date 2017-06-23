history walking
startingFromAll: aCollectionOfVersions do: aBlock
	versionBlock := aBlock.
	aCollectionOfVersions do: [:each | self addStart: each].
	self performSearch.