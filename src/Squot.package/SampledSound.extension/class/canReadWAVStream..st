*Squot-Mapper-Sound
canReadWAVStream: aStream
	aStream reset; binary; skip: 8.
	^ (aStream next: 4) asString = 'WAVE'