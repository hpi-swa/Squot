accessing artifacts
includesArtifact: anArtifact
	| packageName |
	packageName := anArtifact packageName.
	environment packageOrganizer packageNamed: packageName ifAbsent: [^ false].
	^ true