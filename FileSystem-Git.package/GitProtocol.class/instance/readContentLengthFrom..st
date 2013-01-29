private
readContentLengthFrom: aStream
	^ Integer readFrom: (aStream next: 4) asString base: 16