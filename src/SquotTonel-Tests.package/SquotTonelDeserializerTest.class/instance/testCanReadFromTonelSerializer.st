tests
testCanReadFromTonelSerializer
	self assert:
		(SquotTonelDeserializer canReadObjectSerializedBy: SquotTonelSerializer new name).