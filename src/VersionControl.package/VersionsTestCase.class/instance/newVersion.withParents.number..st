helpers
newVersion: message withParents: parentVersions number: aNumber
	^ VersionsTestsFakeVersion
		number: aNumber
		describedAs: message
		withParents: parentVersions