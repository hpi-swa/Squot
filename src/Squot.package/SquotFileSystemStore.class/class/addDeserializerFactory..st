deserialization registry
addDeserializerFactory: aDeserializerFactory
	(DefaultDeserializerRegistry ifNotNil: [:it | it includes: aDeserializerFactory]) ifFalse:
		[DefaultDeserializerRegistry :=
			DefaultDeserializerRegistry
				ifNil: [Array with: aDeserializerFactory]
				ifNotNil: [:registry | registry copyWith: aDeserializerFactory]].