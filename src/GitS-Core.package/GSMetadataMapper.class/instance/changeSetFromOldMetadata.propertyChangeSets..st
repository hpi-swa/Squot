changes-creation
changeSetFromOldMetadata: aMetadata propertyChangeSets: aCollection
	^ GSMetadataChangeSet
		withMapper: self
		oldMetadata: aMetadata
		propertyChangeSets: (aCollection reject: #isNil)