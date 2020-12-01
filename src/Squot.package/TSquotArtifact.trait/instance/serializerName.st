*Squot-FileSystemStore
serializerName
	^ self storeInfo serializer
		ifNil: [ | serializer |
			serializer := self content preferredSerializer.
			self storeInfo serializer: serializer.
			^ serializer name]