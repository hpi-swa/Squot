testing
canReadAssetFrom: aStream
	^ [(self readAssetFrom: aStream) isAnimated] ifError: [false]