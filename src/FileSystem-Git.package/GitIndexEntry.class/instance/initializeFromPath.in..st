initialize-release
initializeFromPath: aRelativePath in: aDirectoryReference
	^ self initializeFromReference: (aDirectoryReference resolve: aRelativePath) path: aRelativePath