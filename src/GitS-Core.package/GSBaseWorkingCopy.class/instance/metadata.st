accessing
metadata
	^ GSMetadata new
		name: self name;
		mappers: self mappers copy;
		setCurrentVersion;
		yourself