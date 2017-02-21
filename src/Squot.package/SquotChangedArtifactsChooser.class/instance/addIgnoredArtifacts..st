initialize-release
addIgnoredArtifacts: artifactsCollection
	artifactsCollection do: [:each | ignored at: each path put: each].