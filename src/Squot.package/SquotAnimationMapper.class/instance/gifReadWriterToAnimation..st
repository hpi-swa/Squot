migrations
gifReadWriterToAnimation: aGIFReadWriter
	^ SquotAnimation gif: (ByteArray streamContents: [:stream |
		aGIFReadWriter setStream: stream.
		[aGIFReadWriter frames do: [:each | aGIFReadWriter nextPutFrame: each]]
			ensure: [aGIFReadWriter close; setStream: nil]])