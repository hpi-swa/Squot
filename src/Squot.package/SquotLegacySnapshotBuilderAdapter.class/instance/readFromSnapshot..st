initialize-release
readFromSnapshot: aSquotProjectSnapshot 
	project := aSquotProjectSnapshot project copy.
	aSquotProjectSnapshot artifacts keysAndValuesDo:
		[:eachId :eachArtifact |
		artifactSnapshots putArtifact: (aSquotProjectSnapshot snapshotArtifact: eachArtifact) copy].