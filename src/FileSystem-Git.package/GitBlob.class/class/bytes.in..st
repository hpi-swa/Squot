instance creation
bytes: aByteArray in: aRepository
	^ self new 
		bytes: aByteArray asByteArray;
		repository: aRepository;
		yourself