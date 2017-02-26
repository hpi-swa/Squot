streams
readStreamDo: aBlock
	"Evaluate aBlock with an FSReadStream on myself. 
	Note this will not create a new file it does not exist already"
	| stream |
	stream := self readStream.
	^ [ aBlock value: stream ] ensure: [ stream close ]