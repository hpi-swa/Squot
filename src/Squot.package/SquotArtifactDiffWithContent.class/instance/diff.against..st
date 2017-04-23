initialize-release
diff: leftArtifact against: rightArtifact
	super diff: leftArtifact against: rightArtifact.
	diffContent := leftArtifact diffContentAgainstThatOf: rightArtifact.
	topNodes := diffContent
		ifNil: [#()]
		ifNotNil: [diffContent asSquotHierarchicalDiff].