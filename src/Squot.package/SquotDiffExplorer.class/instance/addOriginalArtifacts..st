initialize-release
addOriginalArtifacts: artifactsCollection
	artifactsCollection do: [:each | original at: each path put: each].