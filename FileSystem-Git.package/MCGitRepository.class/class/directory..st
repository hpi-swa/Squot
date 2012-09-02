instance creation
directory: aString
	^ self reference: (FSFilesystem disk referenceTo: aString)