class initialization
initialize
	"DefaultDeserializerRegistry := #().
	self initialize"
	self addDeserializerFactory: SquotSmartRefStreamDeserializer.
	self addDeserializerFactory: SquotCypressCodeDeserializer.
	self addDeserializerFactory: SquotStonFileCodec.
	self addDeserializerFactory: SquotTextFileCodec.