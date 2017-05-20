operations
openForUpdateDo: aBlock
	"Read and keep entries in-memory during aBlock"
	indexFile fileStreamWritable: true do: [:stream |
		fileStream := stream.
		stream binary.
		self readFrom: stream.
		aBlock value: self.
		stream reset; truncate.
		self writeTo: stream]