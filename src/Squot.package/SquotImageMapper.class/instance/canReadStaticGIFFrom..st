testing
canReadStaticGIFFrom: aStream
	^ [(SquotAnimationMapper readGIF: aStream) isAnimated not] ifError: [false]