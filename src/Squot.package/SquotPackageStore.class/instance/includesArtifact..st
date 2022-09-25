accessing artifacts
includesArtifact: anArtifact
	| packageName |
	packageName := self packageNameOf: anArtifact.
	environment packageOrganizer packageNamed: packageName ifAbsent: [^ false].
	^ true