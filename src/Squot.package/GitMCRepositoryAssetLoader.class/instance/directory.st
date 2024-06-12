accessing
directory
	self directory: (self repository
		projectDirectoryFrom: self repository projectPath
		version: self repository projectVersion) asFSReference.
	^ super directory