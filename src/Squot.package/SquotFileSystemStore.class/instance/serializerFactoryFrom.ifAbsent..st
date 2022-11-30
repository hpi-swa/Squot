private storing
serializerFactoryFrom: aTrackedObjectMetadata ifAbsent: fallbackBlock
	| name factoryName |
	name := aTrackedObjectMetadata serializer.
	name ifNil: [^ fallbackBlock value].
	factoryName := name substrings first.
	^ (Environment current valueOf: factoryName asSymbol)
		ifNotNil: [:factory | self flag: 'The version part is currently ignored.'.
			^ factory]
		ifNil: [self error: 'Unknown serializer: ', name]