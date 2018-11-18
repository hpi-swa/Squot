initialize-release
diff: leftArtifact against: rightArtifact withBase: baseArtifact
	left := leftArtifact. right := rightArtifact. base := baseArtifact.
	diffContent := leftArtifact diffContentAgainstThatOf: rightArtifact withBase: baseArtifact.