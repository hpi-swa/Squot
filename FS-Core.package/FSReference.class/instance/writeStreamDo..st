streams
writeStreamDo: aBlock
	"Create the file if necessary and evaluate aBlock with an FSWriteStream as argument."
	| stream |
	stream := self writeStream.
	^ [ aBlock value: stream ]
		ensure: [ stream close ]