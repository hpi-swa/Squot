initialize-release
diff: leftArtifact against: rightArtifact
	left := leftArtifact.
	right := rightArtifact.
	(left respondsTo: #applyLoadStatusTo:) ifTrue: [left applyLoadStatusTo: self].