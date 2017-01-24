accessing
fileContents
	^ metadataFile readStreamDo: [:stream | stream contents asString]