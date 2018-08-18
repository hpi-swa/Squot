adding
add: anArtifact
	artifacts at: anArtifact path put: anArtifact.
	loadOrder add: anArtifact path.
	^ anArtifact