initialize-release
diff: leftArtifact against: rightArtifact
	super diff: left against: right.
	diffContent := leftArtifact content squotDiffAgainst: rightArtifact content.
	topNodes := diffContent asSquotHierarchicalDiff.