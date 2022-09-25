adding and removing
addAll: aCollectionOfArtifacts
	aCollectionOfArtifacts do: [:each | self add: each].