deserialization registry
addDeserializerFactory: aDeserializerFactory
	DefaultDeserializerRegistry ifNil:
		[DefaultDeserializerRegistry := Array with: aDeserializerFactory.
		^ aDeserializerFactory].
	(DefaultDeserializerRegistry includes: aDeserializerFactory) ifFalse:
		[DefaultDeserializerRegistry :=
			DefaultDeserializerRegistry copyWith: aDeserializerFactory].