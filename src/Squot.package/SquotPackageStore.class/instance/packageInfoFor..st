private
packageInfoFor: anArtifact
	| packageName packageOrganizer packageInfo |
	packageName := self packageNameOf: anArtifact.
	packageOrganizer := environment packageOrganizer.
	packageInfo := packageOrganizer packageNamed: packageName ifAbsent: [packageOrganizer registerPackageNamed: packageName; packageNamed: packageName ifAbsent: [self error: 'Failed to register package']].
	^ packageInfo