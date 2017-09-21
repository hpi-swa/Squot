serializing
serializerName
	^ storeInfo serializer
		ifNil: [ | serializer |
			serializer := self content preferredSerializer.
			storeInfo serializer: serializer.
			^ serializer name]