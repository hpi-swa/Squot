initialize-release
diff: leftArtifact against: rightArtifact
	super diff: leftArtifact against: rightArtifact.
	self flag: #deprecated. 'Compute differences in the caller and use full constructor for the modification instead'.
	diffContent := leftArtifact diffContentAgainstThatOf: rightArtifact.
	metadataDiff := leftArtifact storeInfo squotDiffAgainst: rightArtifact storeInfo.
	(rightArtifact respondsTo: #applyLoadStatusTo:) ifTrue:
		[rightArtifact applyLoadStatusTo: self].