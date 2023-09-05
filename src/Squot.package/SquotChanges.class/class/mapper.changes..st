instance creation
mapper: aMapper changes: aCollection
	^ self new
		mapper: aMapper;
		changes: aCollection;
		yourself