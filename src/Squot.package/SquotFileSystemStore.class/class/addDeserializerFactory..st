deserialization registry
addDeserializerFactory: aDeserializerFactory
	(DefaultDeserializerRegistry includes: aDeserializerFactory) ifFalse:
		[DefaultDeserializerRegistry :=
			DefaultDeserializerRegistry copyWith: aDeserializerFactory].