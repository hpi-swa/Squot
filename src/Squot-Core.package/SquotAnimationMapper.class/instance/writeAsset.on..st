migrations
writeAsset: aGIFReadWriter on: aStream
	aGIFReadWriter setStream: aStream.
	[aGIFReadWriter frames do: [:each | aGIFReadWriter nextPutFrame: each]]
		ensure: [aGIFReadWriter close; setStream: nil].