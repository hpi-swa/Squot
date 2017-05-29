initialize-release
originalArtifacts: aSquotSnapshot
	originalSnapshot := aSquotSnapshot.
	proposedSnapshot ifNotNil: [self updateDiffsFromSnapshots].