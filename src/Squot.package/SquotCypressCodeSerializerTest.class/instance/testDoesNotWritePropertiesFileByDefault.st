tests
testDoesNotWritePropertiesFileByDefault
	| directory serializer artifact |
	directory := FileSystem memory root.
	serializer := SquotCypressCodeSerializer writingBelow: directory.
	artifact := (MCSnapshot fromDefinitions: {MCOrganizationDefinition categories: #('Empty')})
		asSquotArtifactForPackage: (PackageInfo new packageName: 'Empty').
	serializer write: artifact.
	self deny: (directory / '.properties') exists.