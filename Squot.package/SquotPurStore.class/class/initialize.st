as yet unclassified
initialize
	"self initialize"
	DefaultDeserializerRegistry ifNil: [DefaultDeserializerRegistry := IdentitySet new].
	self addDeserializerFactory: SquotSmartRefStreamDeserializer.
	self addDeserializerFactory: SquotCypressCodeDeserializer.