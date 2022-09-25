accessing
artifacts
	^ artifacts ifNil: [artifacts := store readProject artifacts]