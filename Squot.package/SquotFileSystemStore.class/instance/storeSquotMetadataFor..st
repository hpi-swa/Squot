private storing
storeSquotMetadataFor: anArtifact
	self flag: #featureEnvy.
	(self metadataFor: anArtifact)
		writeClassName: (anArtifact storeInfo at: #objectClassName)
		serializerName: (anArtifact storeInfo at: #serializer).
	