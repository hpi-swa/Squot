version-io
readVersionFrom: aStream
	^ (self writerClass on: aStream) nextImage