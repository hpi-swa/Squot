private storing
serializerFactoryFor: anArtifact
	| name factoryName |
	name := anArtifact serializerName.
	name ifNil: [^ anArtifact content preferredSerializer].
	factoryName := name substrings first.
	^ (Environment current valueOf: factoryName asSymbol)
		ifNotNilDo: [:factory | self flag: 'The version part is currently ignored.'.
			^ factory]
		ifNil: [self error: 'Unknown serializer: ', name]