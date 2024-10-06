instance creation
build: aCollection into: aSpec
	^ self new
		children: aCollection;
		innerSpec: aSpec;
		yourself