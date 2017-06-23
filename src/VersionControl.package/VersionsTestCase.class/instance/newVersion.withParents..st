helpers
newVersion: message withParents: parentVersions
	^ VersionsTestsFakeVersion
		number: self nextFakeVersionNumber
		describedAs: message
		withParents: parentVersions