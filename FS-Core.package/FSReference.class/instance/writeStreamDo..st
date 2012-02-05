streams
writeStreamDo: aBlock
	"Create a file if not present and execute aBlock (with a stream) as argument."
	| stream |
	stream := self writeStream.
	^ [ aBlock value: stream ]
		ensure: [ stream close ]