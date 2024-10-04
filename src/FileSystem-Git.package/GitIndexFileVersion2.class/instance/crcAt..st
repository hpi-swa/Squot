accessing
crcAt: index
	^ self readStreamDo: [:stream |
		(stream
			position: index * 4 + self crcTableStart;
			next: 4) asInteger]