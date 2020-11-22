initialize-release
diff: leftArtifact against: rightArtifact
	left := leftArtifact.
	right := rightArtifact.
	isLoadedInWorkingCopy := false.
	(left respondsTo: #applyLoadStatusTo:) ifTrue: [left applyLoadStatusTo: self].