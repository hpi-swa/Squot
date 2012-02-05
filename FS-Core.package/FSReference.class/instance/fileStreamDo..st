streams
fileStreamDo: aBlock
	"aBlock should get a stream as argument."
	^ self fileStreamWritable: true do: aBlock