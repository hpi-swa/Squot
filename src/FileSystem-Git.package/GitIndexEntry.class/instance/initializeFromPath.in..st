as yet unclassified
initializeFromPath: aRelativePath in: aDirectoryReference
	^ self initializeFromReference: (aDirectoryReference resolve: aRelativePath) path: aRelativePath