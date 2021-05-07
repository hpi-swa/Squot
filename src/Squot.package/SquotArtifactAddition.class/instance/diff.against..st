initialize-release
diff: leftArtifact against: rightArtifact
	super diff: leftArtifact against: rightArtifact.
	willBeLoaded := true. "by default"
	(rightArtifact respondsTo: #applyLoadStatusTo:) ifTrue:
		[rightArtifact applyLoadStatusTo: self].