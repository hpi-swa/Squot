streams
fileStreamDo: aBlock
	"Evaluate aBlock with a StandardFileStream on myself"
	^ self fileStreamWritable: true do: aBlock