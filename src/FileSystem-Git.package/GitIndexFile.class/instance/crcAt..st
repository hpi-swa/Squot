accessing
crcAt: index
	^ (crcTable readStream
		position: (index * 4);
		next: 4) asInteger