operations
openForReadingDo: aBlock
	[indexFile fileStreamWritable: false do: [:stream |
		fileStream := stream.
		stream binary.
		aBlock value: self]]
	ensure: [self releaseData].