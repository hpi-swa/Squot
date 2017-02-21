instance creation
directory: aString
	^ self reference: (FileSystem disk referenceTo: aString)