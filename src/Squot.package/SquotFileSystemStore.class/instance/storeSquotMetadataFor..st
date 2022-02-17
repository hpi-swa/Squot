private storing
storeSquotMetadataFor: anArtifact
	anArtifact id ifNotNil: [anArtifact storeInfo at: #id ifAbsentPut: [anArtifact id]].
	(self metadataFor: anArtifact) updateFrom: anArtifact storeInfo.
	