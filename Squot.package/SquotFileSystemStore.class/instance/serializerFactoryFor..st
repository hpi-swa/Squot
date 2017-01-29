private snapshot building
serializerFactoryFor: anArtifact
	| name factoryName |
	name := anArtifact storeInfo at: #serializer ifAbsent: [self guessSerializerFor: anArtifact].
	factoryName := name substrings first.
	^ (Environment current valueOf: factoryName asSymbol)
		ifNotNilDo: [:factory | self flag: 'The version part is currently ignored.'.
			^ factory]
		ifNil: [self error: 'Unknown serializer: ', name]