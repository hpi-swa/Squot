initialize-release
diff: leftArtifact against: rightArtifact
	super diff: leftArtifact against: rightArtifact.
	diffContent := leftArtifact diffContentAgainstThatOf: rightArtifact.
	(rightArtifact respondsTo: #applyLoadStatusTo:) ifTrue:
		[rightArtifact applyLoadStatusTo: self].