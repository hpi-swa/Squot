private storing
storeSquotMetadataFor: anArtifact
	(self metadataFor: anArtifact) updateFrom: anArtifact.
	