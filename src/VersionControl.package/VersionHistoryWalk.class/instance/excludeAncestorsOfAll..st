history walking
excludeAncestorsOfAll: aCollectionOfVersions
	aCollectionOfVersions do: [:each | self excludeAncestorsOf: each].