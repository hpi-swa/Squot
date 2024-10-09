testing
canReadAssetFrom: aStream
	self writerClass = GSAnimationMapper readerClass ifTrue: [^ self canReadStaticGIFFrom: aStream].
	^ [self writerClass understandsImageFormat: aStream] ifError: [false]