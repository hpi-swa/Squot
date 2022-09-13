private storing
serializerFactoryFor: anArtifact
	^ self serializerFactoryFrom: anArtifact storeInfo ifAbsent: [^ anArtifact content preferredSerializer]