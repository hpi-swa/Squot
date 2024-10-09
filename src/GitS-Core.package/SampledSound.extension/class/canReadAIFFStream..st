*GitS-Core-Sound
canReadAIFFStream: aStream
	aStream reset; binary.
	^ (aStream next: 4) asString = 'FORM'