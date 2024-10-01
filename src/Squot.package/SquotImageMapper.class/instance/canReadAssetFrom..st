testing
canReadAssetFrom: aStream
	self writerClass = SquotAnimationMapper readerClass ifTrue: [^ self canReadStaticGIFFrom: aStream].
	^ [self writerClass understandsImageFormat: aStream] ifError: [false]