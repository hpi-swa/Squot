Squot deserialization
canReadObjectSerializedBy: serializerName
	^ serializerName beginsWith: 'SquotSmartRefStreamSerializer'