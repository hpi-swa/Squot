adding
add: anArtifact
	artifacts at: anArtifact path put: anArtifact.
	(loadOrder includes: anArtifact path) ifFalse: [loadOrder add: anArtifact path].
	^ anArtifact