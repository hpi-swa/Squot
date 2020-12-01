accessing
working: anArtifact
	super working: anArtifact.
	graphMerge working: anArtifact content.
	(anArtifact respondsTo: #applyLoadStatusTo:) ifTrue: [anArtifact applyLoadStatusTo: self].