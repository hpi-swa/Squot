changes-creation
metadataChangeSetFromOldMetadata: aMetadata propertyChangeSets: aCollection
	^ SquotMetadataChangeSet
		withMapper: self
		oldMetadata: aMetadata
		propertyChangeSets: (aCollection reject: #isNil)