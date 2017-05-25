history walking
startingFrom: aVersion
	versionBlock := nil.
	self addStart: aVersion.
	self performSearch.
	^ versionList