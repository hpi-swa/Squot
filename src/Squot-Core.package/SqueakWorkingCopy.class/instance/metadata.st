accessing
metadata
	^ SquotMetadata new
		name: self name;
		mappers: self mappers copy;
		setCurrentVersion;
		yourself