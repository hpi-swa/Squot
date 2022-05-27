adding and removing
copySettingsFrom: anArtifact to: newTrackedObjectMetadata
	| serializer |
	serializer := self serializerFactoryFrom: anArtifact storeInfo ifAbsent: [^ self].
	serializer copySettingsFrom: anArtifact to: newTrackedObjectMetadata.