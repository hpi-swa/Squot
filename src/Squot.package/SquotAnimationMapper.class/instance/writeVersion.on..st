version-io
writeVersion: aCollection on: aStream
	| writer |
	writer := self writerClass on: aStream.
	[aCollection do: [:each | writer nextPutFrame: each]]
		ensure: [writer close].