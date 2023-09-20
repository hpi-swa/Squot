instance creation
withMapper: aMapper old: aCollection new: anotherCollection
	^ (self withMapper: aMapper)
		oldMappers: aCollection;
		newMappers: anotherCollection;
		yourself