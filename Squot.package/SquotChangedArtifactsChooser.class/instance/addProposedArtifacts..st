initialize-release
addProposedArtifacts: artifactsCollection
	artifactsCollection do: [:each | proposed at: each path put: each].