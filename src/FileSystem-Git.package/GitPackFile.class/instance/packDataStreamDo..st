public-accessing
packDataStreamDo: aBlock
	^ self reference readStreamDo: [:stream | stream binary. aBlock value: stream]