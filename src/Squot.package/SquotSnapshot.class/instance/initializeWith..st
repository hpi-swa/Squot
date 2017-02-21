initialize-release
initializeWith: aCollectionOfArtifacts
	self initialize.
	aCollectionOfArtifacts do: [:each | artifacts at: each path put: each].