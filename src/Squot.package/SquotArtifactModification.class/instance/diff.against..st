initialize-release
diff: leftArtifact against: rightArtifact
	super diff: leftArtifact against: rightArtifact.
	diffContent := leftArtifact diffContentAgainstThatOf: rightArtifact.
	metadataDiff := leftArtifact storeInfo squotDiffAgainst: rightArtifact storeInfo. self flag: #generality. "Should artifacts be able to influence this further?"
	(rightArtifact respondsTo: #applyLoadStatusTo:) ifTrue:
		[rightArtifact applyLoadStatusTo: self].