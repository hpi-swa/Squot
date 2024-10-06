instance creation
withMapper: aMapper old: aCollection potentiallyRemoved: anotherCollection changeSets: aDictionary
	^ (self withMapper: aMapper)
		oldMappers: aCollection;
		potentiallyRemovedMappers: anotherCollection;
		mapperChangeSets: aDictionary;
		yourself