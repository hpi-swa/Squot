writing
writeClassName: aClassName serializerName: serializerName
	metadataFile writeStreamDo: [:stream | stream
		nextPutAll: aClassName;
		nextPutAll: ' -> ';
		nextPutAll: serializerName;
		truncate].