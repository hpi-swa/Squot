class initialization
initialize
	"DefaultDeserializerRegistry := nil.
	self initialize"
	self addDeserializerFactory: SquotSmartRefStreamDeserializer.
	self addDeserializerFactory: SquotCypressCodeDeserializer.
	self addDeserializerFactory: SquotStonFileCodec.
	self addDeserializerFactory: SquotTextFileCodec.