instance creation
withMapper: aMapper contents: aByteArray
	^ self new
		mapper: aMapper;
		contents: aByteArray;
		yourself