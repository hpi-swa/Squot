deserialization registry
removeDeserializerFactory: aDeserializerFactory
	DefaultDeserializerRegistry :=
		DefaultDeserializerRegistry copyWithout: aDeserializerFactory.