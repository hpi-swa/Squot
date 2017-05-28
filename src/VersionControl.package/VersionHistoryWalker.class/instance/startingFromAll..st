history walking
startingFromAll: aCollectionOfVersions
	versionBlock := nil.
	aCollectionOfVersions do: [:each | self addStart: each].
	self performSearch.
	^ versionList