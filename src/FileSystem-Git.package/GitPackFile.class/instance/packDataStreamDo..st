public-accessing
packDataStreamDo: aBlock
	^ packData
		ifNotNil: [aBlock value: packData readStream]
		ifNil: [self reference readStreamDo: [:stream | stream binary. aBlock value: stream]]