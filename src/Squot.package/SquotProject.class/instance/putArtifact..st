adding and removing
putArtifact: anArtifact
	self assert: anArtifact id notNil.
	artifacts at: anArtifact id put: anArtifact.