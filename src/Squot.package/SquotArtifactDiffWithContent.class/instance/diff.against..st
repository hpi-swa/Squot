initialize-release
diff: leftArtifact against: rightArtifact
	super diff: leftArtifact against: rightArtifact.
	diffContent := leftArtifact content squotDiffAgainst: rightArtifact content.
	topNodes := diffContent
		ifNil: [#()]
		ifNotNil: [diffContent asSquotHierarchicalDiff].