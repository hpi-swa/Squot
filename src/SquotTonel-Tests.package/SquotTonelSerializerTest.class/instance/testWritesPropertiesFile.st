tests
testWritesPropertiesFile
	| directory serializer artifact |
	directory := FileSystem memory root.
	serializer := SquotTonelSerializer writingBelow: directory.
	artifact := (MCSnapshot fromDefinitions: {MCOrganizationDefinition categories: #('Empty')})
		asSquotArtifactForPackage: (PackageInfo new packageName: 'Empty').
	serializer write: artifact.
	self assert: (directory / '.properties') exists.
	directory / '.properties' readStreamDo:
		[:stream |
		(STON fromStream: stream) = (Dictionary new at: #format put: #tonel; yourself)].