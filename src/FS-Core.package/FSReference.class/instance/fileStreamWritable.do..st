streams
fileStreamWritable: aBoolean do: aBlock
	"Evaluate aBlock with a StandardFileStream on myself"
	| stream |
	stream := filesystem openFileStream: path writable: aBoolean.
	^ [ aBlock value: stream ] ensure: [ stream close ]
	