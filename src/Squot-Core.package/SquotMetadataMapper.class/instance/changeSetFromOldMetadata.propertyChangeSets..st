changes-creation
changeSetFromOldMetadata: aMetadata propertyChangeSets: aCollection
	^ SquotMetadataChangeSet
		withMapper: self
		oldMetadata: aMetadata
		propertyChangeSets: (aCollection reject: #isNil)