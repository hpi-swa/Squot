initialize-release
diff: leftArtifact against: rightArtifact
	super diff: left against: right.
	diffContent := leftArtifact contents squotDiffAgainst: rightArtifact contents.