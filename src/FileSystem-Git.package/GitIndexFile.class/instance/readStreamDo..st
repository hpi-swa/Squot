private
readStreamDo: aBlock
	^ self reference readStreamDo: [:stream |
		stream binary.
		aBlock value: stream]