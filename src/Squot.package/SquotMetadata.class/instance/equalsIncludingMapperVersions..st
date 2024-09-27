comparing
equalsIncludingMapperVersions: anObject
	^ self equals: anObject withMappersConversion: [:mappers |
		(PluggableSet hashBlock: #hashIncludingVersion equalBlock: #equalsIncludingVersion:)
			addAll: mappers;
			yourself]