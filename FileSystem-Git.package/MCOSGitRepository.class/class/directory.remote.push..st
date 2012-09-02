instance creation
directory: aString remote: remote push: shouldPush
	^ (self reference: (FSFilesystem disk referenceTo: aString))
		remote: remote;
		pushAutomatically: shouldPush;
		yourself