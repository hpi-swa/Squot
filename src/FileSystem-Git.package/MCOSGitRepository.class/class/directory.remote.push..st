instance creation
directory: aString remote: remote push: shouldPush
	^ (self reference: (FileSystem disk referenceTo: aString))
		remote: remote;
		pushAutomatically: shouldPush;
		yourself