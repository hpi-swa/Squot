tests
testWritesPropertiesFileIfItExistsAlready
	| directory propertiesFile serializer artifact |
	directory := FileSystem memory root.
	(propertiesFile := directory / '.properties') writeStreamDo: [:stream | stream nextPutAll: '{
	#format : #tonel
}
'].
	serializer := SquotCypressCodeSerializer writingBelow: directory.
	artifact := (MCSnapshot fromDefinitions: {MCOrganizationDefinition categories: #('Empty')})
		asSquotArtifactForPackage: (PackageInfo new packageName: 'Empty').
	serializer write: artifact.
	self assert: propertiesFile exists.
	propertiesFile readStreamDo:
		[:stream | self assert: (stream upToEnd = '{
	#format : #filetree
}
')].