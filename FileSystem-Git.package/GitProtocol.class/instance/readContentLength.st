accessing
readContentLength
	^ (Integer readFrom: (self stream next: 4) asString base: 16)