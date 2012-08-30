private
readContentLength
	^ (Integer readFrom: (self socketStream next: 4) asString base: 16)