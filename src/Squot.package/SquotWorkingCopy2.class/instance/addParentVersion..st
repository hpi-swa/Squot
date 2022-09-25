ancestry
addParentVersion: aVersion 
	(additionalParentVersions includes: aVersion)
		ifFalse: [additionalParentVersions add: aVersion]