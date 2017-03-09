class initialization
initialize
	"self initialize"
	DefaultDeserializerRegistry ifNil: [DefaultDeserializerRegistry := IdentitySet new].
	self addDeserializerFactory: SquotSmartRefStreamDeserializer.
	self addDeserializerFactory: SquotCypressCodeDeserializer.
	self addDeserializerFactory: SquotStonFileCodec.
	self addDeserializerFactory: SquotTextFileCodec.