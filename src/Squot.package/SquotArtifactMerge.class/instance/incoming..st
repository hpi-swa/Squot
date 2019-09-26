accessing
incoming: anArtifact
	super incoming: anArtifact.
	graphMerge incoming: anArtifact content.