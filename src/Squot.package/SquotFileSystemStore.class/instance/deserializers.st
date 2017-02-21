private
deserializers
	^ deserializers ifNil: [deserializers := DefaultDeserializerRegistry copy]