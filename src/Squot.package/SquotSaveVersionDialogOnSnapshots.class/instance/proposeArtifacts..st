initialize-release
proposeArtifacts: aSquotSnapshot
	proposedSnapshot := aSquotSnapshot.
	originalSnapshot ifNotNil: [self updateDiffsFromSnapshots].