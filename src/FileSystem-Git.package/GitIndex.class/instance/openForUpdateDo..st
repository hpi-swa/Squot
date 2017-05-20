operations
openForUpdateDo: aBlock
	"Read and keep entries in-memory during aBlock"
	indexFile fileStreamWritable: true do: [:stream |
		fileStream := stream.
		self readFrom: stream.
		^ aBlock value: self]