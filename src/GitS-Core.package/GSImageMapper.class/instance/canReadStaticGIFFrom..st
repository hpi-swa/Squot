testing
canReadStaticGIFFrom: aStream
	^ [(GSAnimationMapper readGIF: aStream) isAnimated not] ifError: [false]