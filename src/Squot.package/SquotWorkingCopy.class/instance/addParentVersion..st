creating new versions
addParentVersion: aVersion
	loadedHistorian version ifNil:
		[loadedHistorian version: aVersion.
		^ self loadedVersion: aVersion].
	(additionalParents ifNil: [self resetAdditionalParents]) add: aVersion.