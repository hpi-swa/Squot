instance creation
withMapper: aMapper oldMetadata: aMetadata propertyChangeSets: aCollection
	^ (self withMapper: aMapper)
		oldMetadata: aMetadata;
		propertyChangeSets: aCollection;
		yourself