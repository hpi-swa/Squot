building
compareIncomingArtifact: anArtifact
	| consolidatedArtifact |
	consolidatedArtifact := incomingArtifactsMapping keyAtValue: anArtifact.
	self compareConsolidatedIncomingArtifact: consolidatedArtifact