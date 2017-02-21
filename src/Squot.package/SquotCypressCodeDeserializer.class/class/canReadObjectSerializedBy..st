Squot deserialization
canReadObjectSerializedBy: serializerName
	^ serializerName beginsWith: 'SquotCypressCodeSerializer' "version?"