accessing
addFetchSpecString: aString
	^ self fetchSpecs add: (GitFetchSpec fromString: aString forRemote: self)